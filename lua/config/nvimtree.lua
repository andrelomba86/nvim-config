-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup(
    {
        update_focused_file = {
            enable = true,
            update_root = false,
            ignore_list = {}
        },
        renderer = {
            group_empty = true,
            icons = {
                show = {
                    git = true,
                    file = true,
                    folder = true,
                    folder_arrow = true
                },
                glyphs = {
                    folder = {
                        arrow_closed = "⏵",
                        arrow_open = "⏷"
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "⌥",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "⊖",
                        ignored = "◌"
                    }
                }
            }
        }
    }
)

-- NvimTree key mappings
vim.keymap.set("n", "<leader>e", function()
    local nvimtree_api = require("nvim-tree.api")

    -- Verifica se está em um buffer da nvim-tree
    if vim.bo.filetype == "NvimTree" then
        nvimtree_api.tree.close()
    else
        nvimtree_api.tree.find_file({
            open = true,
            focus = true
        })
    end
end, {silent = true, noremap = true})
vim.keymap.set("n", "<leader><leader>f", ":NvimTreeFindFile<CR>", {silent = true, noremap = true})
