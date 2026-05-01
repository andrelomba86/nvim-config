-- Gitsigns configuration with AstroNvim-like setup
local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if not ok_gitsigns then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
    },
    signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
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
    max_file_length = 40000,
    preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    word_diff = false,
    linehl = false,
    numhl = false,
    watch_gitdir = {
        follow_files = true,
    },
})

-- Setup keymaps for gitsigns
local function setup_keymaps()
    local keymap_opts = { noremap = true, silent = true }

    -- Navigation
    vim.keymap.set("n", "]g", function()
        if vim.wo.diff then
            return "]g"
        end
        vim.schedule(function()
            gitsigns.next_hunk()
        end)
        return "<Ignore>"
    end, vim.tbl_extend("force", keymap_opts, { expr = true, desc = "Next Hunk" }))

    vim.keymap.set("n", "[g", function()
        if vim.wo.diff then
            return "[g"
        end
        vim.schedule(function()
            gitsigns.prev_hunk()
        end)
        return "<Ignore>"
    end, vim.tbl_extend("force", keymap_opts, { expr = true, desc = "Previous Hunk" }))

    -- Stage
    vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, vim.tbl_extend("force", keymap_opts, { desc = "Stage Hunk" }))
    vim.keymap.set("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, vim.tbl_extend("force", keymap_opts, { desc = "Stage Hunk" }))

    vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, vim.tbl_extend("force", keymap_opts, { desc = "Stage Buffer" }))

    -- Reset
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, vim.tbl_extend("force", keymap_opts, { desc = "Reset Hunk" }))
    vim.keymap.set("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, vim.tbl_extend("force", keymap_opts, { desc = "Reset Hunk" }))

    vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, vim.tbl_extend("force", keymap_opts, { desc = "Reset Buffer" }))

    -- Preview and Blame
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, vim.tbl_extend("force", keymap_opts, { desc = "Preview Hunk" }))
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, vim.tbl_extend("force", keymap_opts, { desc = "Blame Line" }))
    vim.keymap.set("n", "<leader>gB", function()
        gitsigns.blame_line({ full = true })
    end, vim.tbl_extend("force", keymap_opts, { desc = "Blame Line (Full)" }))

    -- Diff
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, vim.tbl_extend("force", keymap_opts, { desc = "Diff This" }))
    vim.keymap.set("n", "<leader>gD", function()
        gitsigns.diffthis("~")
    end, vim.tbl_extend("force", keymap_opts, { desc = "Diff Cached" }))

    -- Toggle
    vim.keymap.set("n", "<leader>gth", gitsigns.toggle_signs, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Signs" }))
    vim.keymap.set("n", "<leader>gtw", gitsigns.toggle_word_diff, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Word Diff" }))
    vim.keymap.set("n", "<leader>gtl", gitsigns.toggle_linehl, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Line Highlight" }))
    vim.keymap.set("n", "<leader>gtn", gitsigns.toggle_numhl, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Num Highlight" }))
    vim.keymap.set("n", "<leader>gtt", gitsigns.toggle_current_line_blame, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Blame" }))

    -- Text object
    vim.keymap.set({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", vim.tbl_extend("force", keymap_opts, { desc = "Inside Hunk" }))
end

setup_keymaps()
