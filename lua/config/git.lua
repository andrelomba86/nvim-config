-- Git tools configuration module
-- Consolidates configuration for git-related tools and keymaps
local M = {}

--- Setup git tools integrations
function M.setup()
    -- Create which-key descriptions for git mappings
    local ok_which, which_key = pcall(require, "which-key")
    if ok_which then
        which_key.add({
            { "<leader>g", group = "Git", icon = "" },
            { "<leader>gs", group = "Stage" },
            { "<leader>gr", group = "Reset" },
            { "<leader>g", desc = "Git Operations" },
        })
    end
end

--- Get git root directory
function M.get_git_root()
    local result = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")
    if vim.v.shell_error == 0 then
        return result[1]
    end
    return nil
end

--- Get current git branch
function M.get_git_branch()
    local result = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    if vim.v.shell_error == 0 then
        return result[1]
    end
    return "unknown"
end

--- Get git status summary
function M.get_git_status()
    local result = vim.fn.systemlist("git status --porcelain 2>/dev/null")
    if vim.v.shell_error == 0 then
        local added, modified, deleted, untracked = 0, 0, 0, 0
        for _, line in ipairs(result) do
            local status = string.sub(line, 1, 2)
            if status == "A " or status == "AM" then
                added = added + 1
            elseif status:match("M") then
                modified = modified + 1
            elseif status == "D " or status == "DM" then
                deleted = deleted + 1
            elseif status == "??" then
                untracked = untracked + 1
            end
        end
        return {
            added = added,
            modified = modified,
            deleted = deleted,
            untracked = untracked,
            total = added + modified + deleted + untracked
        }
    end
    return nil
end

--- Trigger User autocmd for git file
function M.trigger_git_file()
    vim.api.nvim_exec_autocmds("User", { pattern = "GitFile" })
end

return M
