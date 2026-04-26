local M = {}

function M.setup()
    local ok_diffview, diffview = pcall(require, "diffview")
    if not ok_diffview then
        return
    end

    diffview.setup({
        enhanced_diff_hl = true,
        use_icons = true,
        show_help_hints = true,
    })
end

return M
