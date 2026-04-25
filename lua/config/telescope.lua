local ok_telescope, telescope = pcall(require, "telescope")
if not ok_telescope then
    return
end

local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        path_display = {"smart"},
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {prompt_position = "top"}
        }
    }
})

-- VS Code-like quick navigation/search
vim.keymap.set("n", "<leader>p", builtin.find_files, {silent = true, desc = "Find files"})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {silent = true, desc = "Recent files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {silent = true, desc = "Find in files"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {silent = true, desc = "Find buffers"})
vim.keymap.set("n", "<leader>fc", builtin.commands, {silent = true, desc = "Command palette"})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {silent = true, desc = "Find keymaps"})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {silent = true, desc = "Document symbols"})
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, {silent = true, desc = "Workspace symbols"})
