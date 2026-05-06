local ok_treesitter, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not ok_treesitter then
    return
end

treesitter_configs.setup({
    ensure_installed = {"lua", "vim", "vimdoc", "bash", "javascript", "typescript", "tsx", "json", "css", "html"},
    highlight = {enable = true},
    indent = {enable = true},
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
})
