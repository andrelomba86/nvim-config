-- Git utilities and integration setup
-- Handles git status, branch info, and keymaps organization
local M = {}

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

--- Setup which-key descriptions for git operations
function M.setup_which_key()
    local ok_which, which_key = pcall(require, "which-key")
    if not ok_which then
        return
    end

    which_key.add({
        { "<leader>g", group = "Git", icon = "" },
        { "<leader>gb", desc = "Blame" },
        { "<leader>gB", desc = "Blame (Full)" },
        { "<leader>gc", desc = "Close Diffview" },
        { "<leader>gd", desc = "Diff Current" },
        { "<leader>gD", desc = "Diff Cached" },
        { "<leader>gf", desc = "File History" },
        { "<leader>gh", desc = "Repo History" },
        { "<leader>gg", desc = "Neogit (Status)" },
        { "<leader>gm", desc = "Neogit (Commit)" },
        { "<leader>gP", desc = "Neogit (Pull)" },
        { "<leader>gp", desc = "Preview Hunk" },
        { "<leader>gr", desc = "Reset Hunk" },
        { "<leader>gR", desc = "Reset Buffer" },
        { "<leader>gs", desc = "Stage Hunk" },
        { "<leader>gS", desc = "Stage Buffer" },
        { "<leader>gt", group = "Toggle", icon = "✓" },
        { "<leader>gth", desc = "Hunk Signs" },
        { "<leader>gtl", desc = "Line Highlight" },
        { "<leader>gtn", desc = "Number Highlight" },
        { "<leader>gtt", desc = "Current Line Blame" },
        { "<leader>gtw", desc = "Word Diff" },
        { "<leader>gU", desc = "Neogit (Push)" },
        { "<leader>gv", desc = "Diffview" },
        { "<leader>G", group = "Git Browser", icon = "󰊢" },
        { "<leader>Gb", desc = "Branches (Telescope)" },
        { "<leader>Gc", desc = "Commits (Telescope)" },
        { "<leader>Gf", desc = "Files (Telescope)" },
        { "<leader>Gs", desc = "Status (Telescope)" },
        { "]g", desc = "Next Hunk" },
        { "[g", desc = "Previous Hunk" },
    })
end

return M
