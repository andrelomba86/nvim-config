local ok_which_key, which_key = pcall(require, "which-key")
if not ok_which_key then
    return
end

which_key.setup({
    delay = 300,
    preset = "modern"
})

which_key.add({
    {"<space>a", group = "AI"},
    {"<space>c", group = "Code"},
    {"<space>f", group = "Find"},
    {"<space>g", group = "Git"},
    {"<space>gd", desc = "Git diff view"},
    {"<space>gD", desc = "Git diff close"},
    {"<space>gH", desc = "Git file history"},
    {"<space>gL", desc = "Git repo history"},
    {"<space>h", group = "Git Hunks"},
    {"<space>l", group = "LSP"},
    {"<space>x", group = "Diagnostics"},
    {"<space><space>", group = "Explorer"}
})
