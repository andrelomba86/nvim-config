local M = {}

local function find_alias_target(import_path)
    if not import_path:match("^@/") then
        return nil
    end

    local base = import_path:gsub("^@/", "src/")
    local candidates = {
        base,
        base .. ".ts",
        base .. ".tsx",
        base .. ".js",
        base .. ".jsx",
        base .. ".mjs",
        base .. ".cjs",
        base .. ".d.ts",
        base .. "/index.ts",
        base .. "/index.tsx",
        base .. "/index.js",
        base .. "/index.jsx",
        base .. "/index.mjs",
        base .. "/index.cjs",
    }

    local cwd = vim.loop.cwd()
    for _, candidate in ipairs(candidates) do
        local full_path = cwd .. "/" .. candidate
        if vim.fn.filereadable(full_path) == 1 then
            return full_path
        end
    end

    return nil
end

local function detect_import_path()
    local cfile = vim.fn.expand("<cfile>")
    if cfile and cfile ~= "" and cfile:match("^@/") then
        return cfile
    end

    local line = vim.api.nvim_get_current_line()
    local patterns = {
        "from%s*['\"]([^'\"]+)['\"]",
        "require%(%s*['\"]([^'\"]+)['\"]%s*%)",
        "import%s*['\"]([^'\"]+)['\"]",
    }

    for _, pattern in ipairs(patterns) do
        local match = line:match(pattern)
        if match and match ~= "" then
            return match
        end
    end

    return cfile
end

function M.setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
        callback = function(args)
            vim.keymap.set("n", "gf", function()
                local import_path = detect_import_path()
                local resolved = find_alias_target(import_path)

                if resolved then
                    vim.cmd("edit " .. vim.fn.fnameescape(resolved))
                    return
                end

                local ok = pcall(vim.cmd, "normal! gf")
                if not ok then
                    if import_path and import_path:match("^@/") then
                        vim.notify("Import alias nao encontrado: " .. import_path, vim.log.levels.WARN, {title = "gf"})
                        return
                    end

                    pcall(vim.lsp.buf.definition)
                end
            end, {buffer = args.buf, silent = true, desc = "Ir para arquivo/import"})
        end,
    })
end

return M
