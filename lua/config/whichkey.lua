local ok_which_key, which_key = pcall(require, "which-key")
if not ok_which_key then
    return
end

which_key.setup({
    delay = 300,
    preset = "modern"
})

which_key.add({
    {"<leader>c", group = "Code"},
    {"<leader>f", group = "Find"},
    {"<leader>g", group = "Git"},
    {"<leader>h", group = "Git Hunks"},
    {"<leader>l", group = "LSP"},
    {"<leader>x", group = "Diagnostics"},
    {"<leader><leader>", group = "Explorer"}
})
