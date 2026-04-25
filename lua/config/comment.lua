local ok_comment, comment = pcall(require, "Comment")
if not ok_comment then
    return
end

comment.setup()
local api = require("Comment.api")

-- VS Code-like comment toggle. Some terminals send Ctrl+/ as Ctrl-_.
vim.keymap.set("n", "<C-_>", function()
    api.toggle.linewise.current()
end, {silent = true})
vim.keymap.set("x", "<C-_>", function()
    api.toggle.linewise(vim.fn.visualmode())
end, {silent = true})

-- Fallback mapping for terminals where Ctrl+/ is not propagated.
vim.keymap.set("n", "<leader>/", function()
    api.toggle.linewise.current()
end, {silent = true})
vim.keymap.set("x", "<leader>/", function()
    api.toggle.linewise(vim.fn.visualmode())
end, {silent = true})
