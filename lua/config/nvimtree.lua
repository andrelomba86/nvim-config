-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup(
    {
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
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader><leader>f", ":NvimTreeFindFile<CR>", {silent = true, noremap = true})
