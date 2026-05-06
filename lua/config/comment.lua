local ok_comment, comment = pcall(require, "Comment")
if not ok_comment then
    return
end

local utils = require("Comment.utils")
local react_filetypes = {
    javascriptreact = true,
    typescriptreact = true
}

local function line_for_context(ctx)
    local row = vim.api.nvim_win_get_cursor(0)[1]
    if ctx and ctx.range and ctx.range.srow then
        row = ctx.range.srow
    end

    return (vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or "")
end

local function looks_like_jsx(line)
    local trimmed = vim.trim(line)
    return trimmed:match("^<") ~= nil
end

local ok_ts_comment, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
local ts_pre_hook = nil
if ok_ts_comment then
    ts_pre_hook = ts_comment.create_pre_hook()
end

comment.setup({
    pre_hook = function(ctx)
        if ts_pre_hook then
            local calculated = ts_pre_hook(ctx)
            if calculated and calculated ~= "" then
                return calculated
            end
        end

        if react_filetypes[vim.bo.filetype] and ctx and ctx.ctype == utils.ctype.linewise and looks_like_jsx(line_for_context(ctx)) then
            return "{/* %s */}"
        end

        return vim.bo.commentstring
    end
})
local api = require("Comment.api")

-- VS Code-like comment toggle. Some terminals send Ctrl+/ as Ctrl-_.
vim.keymap.set("n", "<C-_>", function()
    api.toggle.linewise.current()
end, {silent = true, desc = "Toggle comment"})
vim.keymap.set("x", "<C-_>", function()
    api.toggle.linewise(vim.fn.visualmode())
end, {silent = true, desc = "Toggle comment"})

-- Fallback mapping for terminals where Ctrl+/ is not propagated.
vim.keymap.set("n", "<space>/", function()
    api.toggle.linewise.current()
end, {silent = true, desc = "Toggle comment"})
vim.keymap.set("x", "<space>/", function()
    api.toggle.linewise(vim.fn.visualmode())
end, {silent = true, desc = "Toggle comment"})
