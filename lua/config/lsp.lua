local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp_lsp then
    return
end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local has_new_lsp_api = vim.lsp and (type(vim.lsp.config) == "function" or type(vim.lsp.config) == "table") and type(vim.lsp.enable) == "function"
local lspconfig = nil

if not has_new_lsp_api then
    local ok_lspconfig, lspconfig_mod = pcall(require, "lspconfig")
    if not ok_lspconfig then
        return
    end
    lspconfig = lspconfig_mod
end

local function setup_server(server_name, server_opts)
    if has_new_lsp_api then
        vim.lsp.config(server_name, server_opts)
        vim.lsp.enable(server_name)
        return true
    end

    if lspconfig and lspconfig[server_name] then
        lspconfig[server_name].setup(server_opts)
        return true
    end

    return false
end

mason_lspconfig.setup({
    ensure_installed = {"lua_ls", "ts_ls"},
    automatic_enable = false
})

local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr, silent = true}
    local ts_filetypes = {
        typescript = true,
        typescriptreact = true,
        javascript = true,
        javascriptreact = true
    }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    local function code_action_with_feedback(action_opts, done_delay_ms)
        local timeout_ms = action_opts.timeout_ms or 1200
        local notify_id = vim.notify("Buscando code actions...", vim.log.levels.INFO, {
            title = "LSP",
            timeout = false
        })

        vim.lsp.buf.code_action(action_opts)

        vim.defer_fn(function()
            vim.notify("Code actions prontas.", vim.log.levels.INFO, {
                title = "LSP",
                replace = notify_id,
                timeout = done_delay_ms or 800
            })
        end, timeout_ms + 50)
    end

    vim.keymap.set("n", "<leader>rn", function()
        local new_name = vim.fn.input("Rename to: ", vim.fn.expand("<cword>"))
        if new_name == nil or new_name == "" then
            return
        end
        vim.lsp.buf.rename(new_name)
    end, opts)

    vim.keymap.set("n", "<leader>ca", function()
        local ft = vim.bo[bufnr].filetype
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        code_action_with_feedback({
            timeout_ms = 1200,
            context = {
                diagnostics = vim.diagnostic.get(bufnr, {lnum = lnum})
            },
            filter = function(action)
                if not ts_filetypes[ft] then
                    return true
                end

                local kind = action.kind or ""
                local title = string.lower(action.title or "")

                if kind:match("^refactor%.move") then
                    return false
                end

                if title:match("move to new file") or title:match("move to a new file") then
                    return false
                end

                return true
            end
        })
    end, opts)

    -- Versao completa para casos em que voce quer todas as code actions sem limite de timeout.
    vim.keymap.set("n", "<leader>cA", function()
        local ft = vim.bo[bufnr].filetype
        code_action_with_feedback({
            timeout_ms = 5000,
            filter = function(action)
                if not ts_filetypes[ft] then
                    return true
                end

                local kind = action.kind or ""
                local title = string.lower(action.title or "")

                if kind:match("^refactor%.move") then
                    return false
                end

                if title:match("move to new file") or title:match("move to a new file") then
                    return false
                end

                return true
            end
        }, 1000)
    end, opts)

    vim.keymap.set("n", "<leader>oi", function()
        local params = {
            context = {
                only = {"source.organizeImports"},
                diagnostics = {}
            },
            apply = true
        }

        vim.lsp.buf.code_action(params)
    end, opts)
end

setup_server("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    }
})

-- Prefer ts_ls; fallback to tsserver. vtsls may require client-side commands not available in plain Neovim.
local ts_server_opts = {
    capabilities = capabilities,
    on_attach = on_attach
}

if ts_server_opts.capabilities and ts_server_opts.capabilities.textDocument and ts_server_opts.capabilities.textDocument.rename then
    ts_server_opts.capabilities.textDocument.rename.prepareSupport = false
end

if not setup_server("ts_ls", ts_server_opts) then
    setup_server("tsserver", ts_server_opts)
end

local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = "E ",
    [vim.diagnostic.severity.WARN] = "W ",
    [vim.diagnostic.severity.HINT] = "H ",
    [vim.diagnostic.severity.INFO] = "I "
}

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = diagnostic_signs
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many"
    }
})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {silent = true})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {silent = true})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {silent = true})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {silent = true})
