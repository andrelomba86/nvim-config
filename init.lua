require("biome")
require("config.lazy")
require("config.cocvim")
require("config.nvimtree")
require("config.noice")

-- Set packpath to match runtimepath
vim.o.packpath = vim.o.runtimepath

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Tab and indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

-- Enable mouse support
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- Use bash as the default shell
vim.opt.shell = "/usr/bin/bash"

-- Show tabs and end-of-line characters
vim.opt.listchars = {tab = ">-", eol = "⊲", space = "."} -- ⊲ is U+22B2
-- vim.opt.list = true -- Required to display listchars

-- Highlight the current line
vim.opt.cursorline = true

-- Change colorscheme
vim.cmd("colorscheme gruvbox")

-- vim.opt.t_SI = "\\e[5 q" -- Cursor em linha no modo insert
-- vim.opt.t_EI = "\\e[0 q" -- Cursor em bloco nos outros modos
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25"

-- Highlight open and closing brackets, parentheses, braces and quotes
vim.cmd([[hi MatchParen cterm=underline,bold ctermbg=none ctermfg=red]])

-- Allow cursor movement over wrapped lines
vim.opt.whichwrap:append("h,l,<,>,[,]")

-- Setup vim lightline (statusbar)
vim.g.lightline = {
    active = {
        left = {
            {"mode"},
            {"paste"},
            {"readonly", "filename", "modified"}
        },
        right = {
            {"lineinfo"},
            {"percent"},
            {"fileformat", "fileencoding", "filetype"}
        }
    }
}

-- Highlight active windows
vim.cmd([[highlight InactiveWindow guibg=#161616]])
vim.api.nvim_create_autocmd(
    {"WinEnter", "BufEnter"},
    {
        pattern = "*",
        command = [[setlocal winhighlight=Normal:ActiveWindow]]
    }
)

vim.api.nvim_create_autocmd(
    {"WinLeave", "BufLeave"},
    {
        pattern = "*",
        command = [[setlocal winhighlight=Normal:InactiveWindow]]
    }
)

-- Autoformat on save with Neoformat
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = "*",
        command = "Neoformat"
    }
)

require("config.bufferline")
