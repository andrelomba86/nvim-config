local ok_telescope, telescope = pcall(require, "telescope")
if not ok_telescope then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        path_display = {"smart"},
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {prompt_position = "top"}
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        }
    }
})

-- VS Code-like quick navigation/search
vim.keymap.set("n", "<leader>p", builtin.find_files, {silent = true, desc = "Find files"})
vim.keymap.set("n", "<leader>f.", builtin.resume, {silent = true, desc = "Resume last picker"})
vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, {silent = true, desc = "Find in current buffer"})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {silent = true, desc = "Recent files"})
vim.keymap.set("n", "<leader>fj", builtin.jumplist, {silent = true, desc = "Find jumplist"})
vim.keymap.set("n", "<leader>fm", builtin.marks, {silent = true, desc = "Find marks"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {silent = true, desc = "Find in files"})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {silent = true, desc = "Find current word"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {silent = true, desc = "Find buffers"})
vim.keymap.set("n", "<leader>fc", builtin.commands, {silent = true, desc = "Command palette"})
vim.keymap.set("n", "<leader>fC", builtin.command_history, {silent = true, desc = "Command history"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {silent = true, desc = "Find help"})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {silent = true, desc = "Find diagnostics"})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {silent = true, desc = "Find keymaps"})
vim.keymap.set("n", "<leader>frg", builtin.registers, {silent = true, desc = "Find registers"})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {silent = true, desc = "Document symbols"})
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, {silent = true, desc = "Workspace symbols"})
vim.keymap.set("n", "<leader>Gf", builtin.git_files, {silent = true, desc = "Git files (telescope)"})
vim.keymap.set("n", "<leader>Gs", builtin.git_status, {silent = true, desc = "Git status (telescope)"})
vim.keymap.set("n", "<leader>Gb", builtin.git_branches, {silent = true, desc = "Git branches (telescope)"})
vim.keymap.set("n", "<leader>Gc", builtin.git_commits, {silent = true, desc = "Git commits (telescope)"})
