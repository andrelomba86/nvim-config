-- Diffview configuration - Visual diff viewer
local M = {}

function M.setup()
    local ok_diffview, diffview = pcall(require, "diffview")
    if not ok_diffview then
        return
    end

    diffview.setup({
        diff_binaries = false,
        enhanced_diff_hl = true,
        use_icons = true,
        show_help_hints = true,
        icons = {
            folder_closed = "",
            folder_open = "",
            file = "",
        },
        signs = {
            fold_closed = "",
            fold_open = "",
            done = "✓",
        },
        file_panel = {
            listing_style = "tree",
            tree_options = {
                flatten_dirs = true,
                folder_statuses = "all",
            },
            win_config = {
                position = "left",
                width = 35,
                win_opts = {
                    winbar = "",
                    relativenumber = false,
                    cursorline = true,
                    colorcolumn = "",
                },
            },
        },
        file_history_panel = {
            log_options = {
                git = {
                    single_file = {
                        diff_merges = "combined",
                    },
                    multi_file = {
                        diff_merges = "first-parent",
                    },
                },
            },
            win_config = {
                position = "bottom",
                height = 16,
                win_opts = {
                    winbar = "",
                    relativenumber = false,
                    cursorline = false,
                    colorcolumn = "",
                },
            },
        },
        commit_log_panel = {
            win_config = {
                win_opts = {
                    colorcolumn = "",
                },
            },
        },
        default_args = {
            DiffviewOpen = {},
            DiffviewFileHistory = {},
        },
        hooks = {
            diff_buf_read = function(bufnr)
                vim.opt_local.wrap = true
            end,
            diff_buf_win_enter = function(bufnr, winid, ctx)
                if ctx.layout_name:match("^diff") then
                    vim.opt_local.wrap = true
                end
            end,
        },
        key_bindings = {
            disable_defaults = false,
            view = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
            diff1 = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
            diff2 = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
            diff3 = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
            file_panel = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
            file_history_panel = {
                { "n", "g?", "<cmd>DiffviewTogglePanel<CR>", { noremap = true, silent = true } },
            },
        },
    })
end

return M
