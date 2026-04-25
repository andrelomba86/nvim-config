local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
    return
end

local ok_luasnip, luasnip = pcall(require, "luasnip")
if not ok_luasnip then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "CmpBorder", {link = "FloatBorder"})
vim.api.nvim_set_hl(0, "CmpDocBorder", {link = "FloatBorder"})

cmp.setup({
    completion = {
        autocomplete = {cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter},
        keyword_length = 1
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None"
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None"
        })
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, item)
            local source_labels = {
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]"
            }

            item.menu = source_labels[entry.source.name] or ""
            return item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({select = true})
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    experimental = {
        ghost_text = true
    },
    sources = cmp.config.sources({
        {name = "nvim_lsp"},
        {name = "luasnip"},
        {name = "buffer", keyword_length = 3}
    })
})
