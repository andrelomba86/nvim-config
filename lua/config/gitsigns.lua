local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if not ok_gitsigns then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
    },
})

-- Define keymaps globally (not per-buffer)
local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", { silent = true, noremap = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Navigation between hunks
map("n", "]g", function()
    if vim.wo.diff then
        return "]g"
    end
    vim.schedule(function() gitsigns.next_hunk() end)
    return "<Ignore>"
end, { expr = true, desc = "Next git hunk" })

map("n", "[g", function()
    if vim.wo.diff then
        return "[g"
    end
    vim.schedule(function() gitsigns.prev_hunk() end)
    return "<Ignore>"
end, { expr = true, desc = "Previous git hunk" })

-- Hunk operations
map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

-- Preview and blame
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame line" })
map("n", "<leader>gB", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line (full)" })

-- Diff operations
map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git diff this" })
map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Git diff this (cached)" })

-- Toggle features
map("n", "<leader>gth", gitsigns.toggle_signs, { desc = "Toggle hunk signs" })
map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
map("n", "<leader>gtl", gitsigns.toggle_linehl, { desc = "Toggle line highlight" })
map("n", "<leader>gtn", gitsigns.toggle_numhl, { desc = "Toggle num highlight" })
map("n", "<leader>gtt", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })

-- Text object (select hunk)
map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Inside git hunk" })
