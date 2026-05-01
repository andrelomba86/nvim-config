-- Neogit configuration - Magit-like git client
local M = {}

function M.setup()
    local ok_neogit, neogit = pcall(require, "neogit")
    if not ok_neogit then
        return
    end

    neogit.setup({
        kind = "replace",
        disable_line_numbers = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_signs = false,

        popup = {
            kind = "split",
        },

        integrations = {
            diffview = true,
            telescope = true,
        },

        signs = {
            section = { "▼", "▶" },
            item = { "▼", "▶" },
            hunk = { "󰄱", "󰄲" },
        },

        sections = {
            untracked = {
                folded = false,
            },
            unstaged = {
                folded = false,
            },
            staged = {
                folded = false,
            },
            stashes = {
                folded = true,
            },
            branches = {
                folded = true,
            },
            recent = {
                folded = true,
            },
            remote_branches = {
                folded = true,
            },
        },

        commit_editor = {
            kind = "tab",
        },

        commit_select_view = {
            kind = "tab",
        },

        commit_view = {
            kind = "vsplit",
        },

        log_view = {
            kind = "tab",
        },

        rebase_editor = {
            kind = "tab",
        },

        reflog_view = {
            kind = "tab",
        },

        merge_editor = {
            kind = "tab",
        },

        preview_buffer = {
            kind = "split",
        },

        branch_editor = {
            kind = "split",
        },
    })
end

return M
