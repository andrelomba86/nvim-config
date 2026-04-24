-- Extensões globais do CoC
vim.g.coc_global_extensions = {"coc-tsserver"}

-- Performance e comportamento
vim.opt.updatetime = 300 -- tempo de atualização para CursorHold
vim.opt.backup = false -- não criar backups
vim.opt.writebackup = false -- não escrever backups
vim.opt.signcolumn = "yes" -- sempre mostrar a coluna de sinais

-- Função para checar se há espaço antes do cursor
local function check_backspace()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Keymaps para completar com <Tab>
-- inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<Tab>\<c-r>=coc#on_enter()\<CR>"
vim.keymap.set(
    "i",
    "<Tab>",
    function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#confirm"]()
        elseif check_backspace() then
            return "<Tab>"
        else
            vim.fn["coc#refresh"]()
            return ""
        end
    end,
    {expr = true, silent = true}
)

-- inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
vim.keymap.set("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {expr = true, silent = true})

-- inoremap <expr><CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
vim.keymap.set(
    "i",
    "<CR>",
    [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    {expr = true, silent = true}
)

-- inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
-- vim.keymap.set("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"]], {expr = true})
vim.keymap.set(
    "i",
    "<C-k>",
    function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#prev"](1)
        else
            return "<C-k>"
        end
    end,
    {expr = true, silent = true}
)

-- inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<C-j>" : coc#refresh()
-- vim.keymap.set("i", "<C-j", [[coc#pum#visible() ? coc#pum#next(1) : "\<C-j"]], {expr = true})
vim.keymap.set(
    "i",
    "<C-j>",
    function()
        if vim.fn["coc#pum#visible"]() == 1 then
            return vim.fn["coc#pum#next"](1)
        else
            return "<C-j>"
        end
    end,
    {expr = true, silent = true}
)

-- if has('nvim') ...
if vim.fn.has("nvim") == 1 then
    vim.keymap.set("i", "<C-Space>", "coc#refresh()", {expr = true, silent = true})
else
    vim.keymap.set("i", "<C-@>", "coc#refresh()", {expr = true, silent = true})
end

-- Navegar por diagnostics
-- nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
-- nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true, nowait = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true, nowait = true})

-- GoTo code navigation
-- nmap <silent><nowait> gd <Plug>(coc-definition)
-- nmap <silent><nowait> gy <Plug>(coc-type-definition)
-- nmap <silent><nowait> gi <Plug>(coc-implementation)
-- nmap <silent><nowait> gr <Plug>(coc-references)
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true, nowait = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true, nowait = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true, nowait = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true, nowait = true})

-- Mostrar documentação com 'K'
-- nnoremap <silent> K :call ShowDocumentation()<CR>
vim.keymap.set(
    "n",
    "K",
    function()
        if vim.fn["CocAction"]("hasProvider", "hover") then
            vim.fn["CocActionAsync"]("doHover")
        else
            vim.api.nvim_feedkeys("K", "in", false)
        end
    end,
    {silent = true}
)

-- Highlight the symbol and its references when holding the cursor
vim.api.nvim_create_autocmd(
    "CursorHold",
    {
        pattern = "*",
        command = "silent call CocActionAsync('highlight')"
    }
)

-- Symbol renaming
-- nmap <leader>rn <Plug>(coc-rename)
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")

-- Formatting selected code
-- xmap <leader>f  <Plug>(coc-format-selected)
-- nmap <leader>f  <Plug>(coc-format-selected)
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)")
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)")

-- Setup formatexpr para typescript e json
vim.api.nvim_create_augroup("mygroup", {clear = true})
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {"typescript", "json"},
        command = [[setlocal formatexpr=CocAction('formatSelected')]],
        group = "mygroup"
    }
)
