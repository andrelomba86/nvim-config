vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Keep Copilot enabled by default for common editable filetypes.
vim.g.copilot_filetypes = {
    ["*"] = true,
    help = false,
    gitcommit = true,
    gitrebase = true
}

-- Accept Copilot suggestion without conflicting with cmp's <Tab> mapping.
vim.keymap.set("i", "<C-y>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = "Aceitar sugestao Copilot"
})

vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", {
    silent = true,
    desc = "Descartar sugestao Copilot"
})

vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {
    silent = true,
    desc = "Proxima sugestao Copilot"
})

vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {
    silent = true,
    desc = "Sugestao Copilot anterior"
})

vim.keymap.set("n", "<space>ae", "<cmd>Copilot enable<cr>", {
    silent = true,
    desc = "Copilot enable"
})

vim.keymap.set("n", "<space>ad", "<cmd>Copilot disable<cr>", {
    silent = true,
    desc = "Copilot disable"
})
