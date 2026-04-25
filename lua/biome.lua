vim.g.neoformat_enabled_javascript = {"biome"}
vim.g.neoformat_enabled_javascriptreact = {"biome"}
vim.g.neoformat_enabled_typescript = {"biome"}
vim.g.neoformat_enabled_typescriptreact = {"biome"}
vim.g.neoformat_enabled_json = {"biome"}
vim.g.neoformat_enabled_css = {"biome"}
vim.g.neoformat_javascript_biome = {
    exe = "biome",
    args = {"format", "--config-path", "$HOME/.config/nvim/biome.jsonc", "--stdin-file-path", '"%:p"'},
    stdin = 1
}
vim.g.neoformat_javascriptreact_biome = vim.g.neoformat_javascript_biome
vim.g.neoformat_typescript_biome = vim.g.neoformat_javascript_biome
vim.g.neoformat_typescriptreact_biome = vim.g.neoformat_javascript_biome
vim.g.neoformat_json_biome = vim.g.neoformat_javascript_biome
vim.g.neoformat_css_biome = vim.g.neoformat_javascript_biome
