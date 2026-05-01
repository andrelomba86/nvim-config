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
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { buffer = bufnr, silent = true }, opts or {})
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation between hunks
        map("n", "]g", function()
            if vim.wo.diff then
                return "]g"
            end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, { expr = true, desc = "Next git hunk" })

        map("n", "[g", function()
            if vim.wo.diff then
                return "[g"
            end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, { expr = true, desc = "Previous git hunk" })

        -- Hunk operations
        map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
        map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
        map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })

        -- Preview and blame
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gb", gs.blame_line, { desc = "Blame line" })
        map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, { desc = "Blame line (full)" })

        -- Diff operations
        map("n", "<leader>gd", gs.diffthis, { desc = "Git diff this" })
        map("n", "<leader>gD", function() gs.diffthis("~") end, { desc = "Git diff this (cached)" })

        -- Toggle features
        map("n", "<leader>gh", gs.toggle_signs, { desc = "Toggle hunk signs" })
        map("n", "<leader>gw", gs.toggle_word_diff, { desc = "Toggle word diff" })
        map("n", "<leader>gl", gs.toggle_linehl, { desc = "Toggle line highlight" })
        map("n", "<leader>gn", gs.toggle_numhl, { desc = "Toggle num highlight" })
        map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })

        -- Text object (select hunk)
        map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Inside git hunk" })
    end
})
