local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if not ok_gitsigns then
    return
end

gitsigns.setup({
    signs = {
        add = {text = "+"},
        change = {text = "~"},
        delete = {text = "_"},
        topdelete = {text = "‾"},
        changedelete = {text = "~"}
    },
    current_line_blame = false,
    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, silent = true, desc = desc})
        end

        map("n", "]h", gitsigns.next_hunk, "Next hunk")
        map("n", "[h", gitsigns.prev_hunk, "Previous hunk")
        map("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
        map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", gitsigns.toggle_current_line_blame, "Toggle blame line")
    end
})
