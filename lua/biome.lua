vim.g.neoformat_enabled_javascript = {"biome"}
vim.g.neoformat_enabled_typescript = {"biome"}
vim.g.neoformat_javascript_biome = {
    exe = "biome",
    args = {"format", "--config-path", "$HOME/.config/nvim/biome.jsonc", "--stdin-file-path", '"%:p"'},
    stdin = 1
}
