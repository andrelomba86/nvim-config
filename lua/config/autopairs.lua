local ok_autopairs, autopairs = pcall(require, "nvim-autopairs")
if not ok_autopairs then
    return
end

autopairs.setup({
    check_ts = true,
    fast_wrap = {}
})

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
    return
end

local ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not ok_cmp_autopairs then
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
