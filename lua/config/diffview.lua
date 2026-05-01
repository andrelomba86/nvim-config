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
        },
        signs = {
            fold_closed = "",
            fold_open = "",
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
                },
            },
        },
        file_history_panel = {
            win_config = {
                position = "bottom",
                height = 16,
                win_opts = {
                    winbar = "",
                    relativenumber = false,
                    cursorline = false,
                },
            },
        },
        hooks = {
            diff_buf_read = function(bufnr)
                vim.opt_local.wrap = true
            end,
        },
    })
end

return M
