local ok_illuminate, illuminate = pcall(require, "illuminate")
if not ok_illuminate then
    return
end

illuminate.configure({
    providers = {
        "lsp",
        "treesitter",
        "regex"
    },
    delay = 100,
    filetypes_denylist = {
        "dirvish",
        "fugitive",
        "NvimTree",
        "aerial",
        "neotreetree",
        "help",
        "alpha"
    },
    filetypes_allowlist = {}
})

-- Attach to all buffers
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    callback = function(args)
        illuminate.on_attach(nil, args.buf)
    end
})

vim.api.nvim_set_hl(0, "IlluminatedWord", {bg = "#444466", bold = true})
vim.api.nvim_set_hl(0, "IlluminatedCWord", {bg = "#444466", bold = true})
vim.api.nvim_set_hl(0, "IlluminatedWordText", {bg = "#444466", bold = true})
vim.api.nvim_set_hl(0, "IlluminatedWordRead", {bg = "#444466", bold = true})
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {bg = "#444466", bold = true})
