require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        use_libuv_file_watcher = true,
    },
    window = {
        width = 30,
        mappings = {
            ["<space>"] = "toggle_node",
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",
            ["a"] = {
                "add",
                config = {
                    show_path = "relative"
                }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["c"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["y"] = "copy_to_clipboard",
            ["<c-c>"] = "cancel",
        },
    },
})

-- Neo-tree key mappings
vim.keymap.set(
    "n",
    "<space>e",
    function()
        require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left" })
    end,
    { silent = true, noremap = true, desc = "Abrir explorer" }
)

vim.keymap.set(
    "n",
    "<space><space>f",
    function()
        require("neo-tree.command").execute({ action = "focus", reveal = true, source = "filesystem", position = "left" })
    end,
    { silent = true, noremap = true, desc = "Revelar arquivo" }
)

vim.keymap.set(
    "n",
    "<C-b>",
    function()
        require("neo-tree.command").execute({ action = "show", source = "filesystem", toggle = true })
    end,
    { silent = true, noremap = true, desc = "Alternar sidebar" }
)
