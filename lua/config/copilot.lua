-- Configure copilot.vim using global settings (copilot.vim doesn't expose a Lua module)
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = true,
    help = false,
    gitcommit = true,
    gitrebase = true
}

-- Keymaps for copilot suggestions
vim.keymap.set("i", "<C-y>", 'copilot#Accept("<CR>")', {
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = "Accept Copilot suggestion"
})

vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {
    silent = true,
    desc = "Next Copilot suggestion"
})

vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {
    silent = true,
    desc = "Previous Copilot suggestion"
})

vim.keymap.set("i", "<M-y>", "<Plug>(copilot-dismiss)", {
    silent = true,
    desc = "Dismiss Copilot suggestion"
})

vim.api.nvim_set_hl(0, "CopilotSuggestion", {fg = "#5fd7c7", italic = true})

vim.keymap.set(
    "n",
    "<space>ae",
    "<cmd>Copilot enable<cr>",
    {
        silent = true,
        desc = "Copilot enable"
    }
)

vim.keymap.set(
    "n",
    "<space>ad",
    "<cmd>Copilot disable<cr>",
    {
        silent = true,
        desc = "Copilot disable"
    }
)
