local ok_todo, todo_comments = pcall(require, "todo-comments")
if not ok_todo then
    return
end

todo_comments.setup({
    signs = true,
    sign_priority = 8,
    highlight = {
        multiline = true,
        keyword = "bg",
        after = "fg"
    },
    search = {
        pattern = [[\b(KEYWORDS):]]
    }
})

vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, {silent = true, desc = "Proximo TODO"})

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, {silent = true, desc = "TODO anterior"})

vim.keymap.set("n", "<space>ft", "<cmd>TodoTelescope<cr>", {silent = true, desc = "Buscar TODOs"})
vim.keymap.set("n", "<space>xt", "<cmd>Trouble todo toggle<cr>", {silent = true, desc = "Painel TODOs"})
