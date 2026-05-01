-- Window navigation keymaps
vim.keymap.set("n", "<Tab>", "<C-w>w", { noremap = true, silent = true, desc = "Next window" })
vim.keymap.set("n", "<S-Tab>", "<C-w>W", { noremap = true, silent = true, desc = "Previous window" })
