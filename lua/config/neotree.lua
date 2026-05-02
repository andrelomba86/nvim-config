require("neo-tree").setup(
    {
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_gitignored = false
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false
            },
            use_libuv_file_watcher = true,
            hijack_netrw_behavior = "open_current"
        },
        commands = {
            system_open = function(state)
                vim.ui.open(state.tree:get_node():get_id())
            end,
            parent_or_close = function(state)
                local node = state.tree:get_node()
                if node:has_children() and node:is_expanded() then
                    state.commands.toggle_node(state)
                else
                    require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                end
            end,
            child_or_open = function(state)
                local node = state.tree:get_node()
                if node:has_children() then
                    if not node:is_expanded() then -- if unexpanded, expand
                        state.commands.toggle_node(state)
                    else -- if expanded and has children, seleect the next child
                        if node.type == "file" then
                            state.commands.open(state)
                        else
                            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                        end
                    end
                else -- if has no children
                    state.commands.open(state)
                end
            end,
            copy_selector = function(state)
                local node = state.tree:get_node()
                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local vals = {
                    ["BASENAME"] = modify(filename, ":r"),
                    ["EXTENSION"] = modify(filename, ":e"),
                    ["FILENAME"] = filename,
                    ["PATH (CWD)"] = modify(filepath, ":."),
                    ["PATH (HOME)"] = modify(filepath, ":~"),
                    ["PATH"] = filepath,
                    ["URI"] = vim.uri_from_fname(filepath)
                }

                local options =
                    vim.tbl_filter(
                    function(val)
                        return vals[val] ~= ""
                    end,
                    vim.tbl_keys(vals)
                )
                if vim.tbl_isempty(options) then
                    vim.notify("No values to copy", vim.log.levels.WARN)
                    return
                end
                table.sort(options)
                vim.ui.select(
                    options,
                    {
                        prompt = "Choose to copy to clipboard:",
                        format_item = function(item)
                            return ("%s: %s"):format(item, vals[item])
                        end
                    },
                    function(choice)
                        local result = vals[choice]
                        if result then
                            vim.notify(("Copied: `%s`"):format(result))
                            vim.fn.setreg("+", result)
                        end
                    end
                )
            end
        },
        window = {
            width = 30,
            mappings = {
                ["<S-CR>"] = "system_open",
                ["<Space>"] = false,
                ["[b"] = "prev_source",
                ["]b"] = "next_source",
                O = "system_open",
                Y = "copy_selector",
                h = "parent_or_close",
                l = "child_or_open"
            },
            fuzzy_finder_mappings = {
                ["<C-J>"] = "move_cursor_down",
                ["<C-K>"] = "move_cursor_up"
            }
        }
    }
)
