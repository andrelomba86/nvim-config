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
        { "<space>g", group = "Git", icon = "" },
        { "<space>gb", desc = "Blame" },
        { "<space>gB", desc = "Blame (Full)" },
        { "<space>gc", desc = "Close Diffview" },
        { "<space>gd", desc = "Diff Current" },
        { "<space>gD", desc = "Diff Cached" },
        { "<space>gf", desc = "File History" },
        { "<space>gh", desc = "Repo History" },
        { "<space>gg", desc = "Neogit (Status)" },
        { "<space>gm", desc = "Neogit (Commit)" },
        { "<space>gP", desc = "Neogit (Pull)" },
        { "<space>gp", desc = "Preview Hunk" },
        { "<space>gr", desc = "Reset Hunk" },
        { "<space>gR", desc = "Reset Buffer" },
        { "<space>gs", desc = "Stage Hunk" },
        { "<space>gS", desc = "Stage Buffer" },
        { "<space>gt", group = "Toggle", icon = "✓" },
        { "<space>gth", desc = "Hunk Signs" },
        { "<space>gtl", desc = "Line Highlight" },
        { "<space>gtn", desc = "Number Highlight" },
        { "<space>gtt", desc = "Current Line Blame" },
        { "<space>gtw", desc = "Word Diff" },
        { "<space>gU", desc = "Neogit (Push)" },
        { "<space>gv", desc = "Diffview" },
        { "<space>G", group = "Git Browser", icon = "󰊢" },
        { "<space>Gb", desc = "Branches (Telescope)" },
        { "<space>Gc", desc = "Commits (Telescope)" },
        { "<space>Gf", desc = "Files (Telescope)" },
        { "<space>Gs", desc = "Status (Telescope)" },
        { "]g", desc = "Next Hunk" },
        { "[g", desc = "Previous Hunk" },
    })
end

return M
