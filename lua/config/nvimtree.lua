-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup(
    {
        hijack_cursor = true,
        update_focused_file = {
            enable = true,
            update_root = false,
            ignore_list = {}
        },
        -- filters = {custom = {"^.git$"}},
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
vim.keymap.set(
    "n",
    "<space>e",
    function()
        local nvimtree_api = require("nvim-tree.api")

        -- if vim.bo.filetype == "NvimTree" then
        if nvimtree_api.tree.is_visible() then
            nvimtree_api.tree.close()
        else
            nvimtree_api.tree.find_file(
                {
                    open = true,
                    focus = true
                }
            )
        end
    end,
    {silent = true, noremap = true, desc = "Abrir explorer"}
)
vim.keymap.set(
    "n",
    "<space><space>f",
    ":NvimTreeFindFile<CR>",
    {silent = true, noremap = true, desc = "Revelar arquivo"}
)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", {silent = true, noremap = true, desc = "Alternar sidebar"})
