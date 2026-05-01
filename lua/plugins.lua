return {
    {"tpope/vim-sensible"},
    {"WolfgangMehner/bash-support"},
    {"itchyny/lightline.vim"},
    {"tpope/vim-surround"}, -- replace 'surround closing parens: ysi3w[  ds[
    {
        "numToStr/Comment.nvim",
        config = function()
            require("config.comment")
        end
    },
    {"itmammoth/doorboy.vim"}, -- highlight brackets
    -- { "pangloss/vim-javascript" },                 -- javascript
    -- { "leafgarland/typescript-vim" },             -- typescript
    -- { "maxmellon/vim-jsx-pretty" },

    {"suxpert/vimcaps"}, -- set capslock off when go back to normal mode
    {"ellisonleao/gruvbox.nvim"}, -- tema gruvbox
    {"matze/vim-move"}, -- used to move lines up and down (<a-j>,<a-k>)
    {
        -- file tree
        "nvim-tree/nvim-tree.lua",
        cmd = {"NvimTreeToggle"}, -- 'on': 'NvimTreeToggle'
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    {"sbdchd/neoformat"}, -- code auto formatting (Prettier)
    {"neovim/nvim-lspconfig"},
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"}
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "windwp/nvim-autopairs",
            "rafamadriz/friendly-snippets"
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("config.todo_comments")
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User GitFile",
        config = function()
            require("config.gitsigns")
        end
    },
    {
        "sindrets/diffview.nvim",
        cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewFileHistory"},
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("config.diffview").setup()
        end
    },
    {
        "NeogitOrg/neogit",
        cmd = {"Neogit"},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local neogit = require("neogit")
            neogit.setup({
                kind = "replace",
                disable_line_numbers = false,
                disable_hint = false,
                disable_context_highlighting = false,
                disable_signs = false,
                popup = {
                    kind = "split",
                },
                integrations = {
                    diffview = true,
                    telescope = true,
                },
                signs = {
                    section = { "▶", "▼" },
                    item = { "▶", "▼" },
                    hunk = { "", "" },
                },
            })

            -- Keymaps for Neogit
            vim.keymap.set("n", "<leader>gg", neogit.open, { silent = true, noremap = true, desc = "Neogit open" })
            vim.keymap.set("n", "<leader>gm", function()
                neogit.open({ "commit" })
            end, { silent = true, noremap = true, desc = "Neogit commit" })
            vim.keymap.set("n", "<leader>gP", function()
                neogit.open({ "pull" })
            end, { silent = true, noremap = true, desc = "Neogit pull" })
            vim.keymap.set("n", "<leader>gU", function()
                neogit.open({ "push" })
            end, { silent = true, noremap = true, desc = "Neogit push" })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("config.whichkey")
        end
    },
    {
        "github/copilot.vim",
        event = "VimEnter",
        cmd = {"Copilot"},
        config = function()
            require("config.copilot")
        end
    },
    {
        "doctorfree/cheatsheet.nvim",
        event = "VeryLazy",
        dependencies = {
            {"nvim-telescope/telescope.nvim"},
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"}
        },
        config = function()
            local ctactions = require("cheatsheet.telescope.actions")
            require("cheatsheet").setup(
                {
                    bundled_cheetsheets = {
                        enabled = {"default", "lua", "markdown", "regex", "netrw", "unicode"},
                        disabled = {"nerd-fonts"}
                    },
                    bundled_plugin_cheatsheets = {
                        enabled = {
                            "auto-session",
                            "goto-preview",
                            "octo.nvim",
                            "telescope.nvim",
                            "vim-easy-align",
                            "vim-sandwich"
                        },
                        disabled = {"gitsigns"}
                    },
                    include_only_installed_plugins = true,
                    telescope_mappings = {
                        ["<CR>"] = ctactions.select_or_fill_commandline,
                        ["<A-CR>"] = ctactions.select_or_execute,
                        ["<C-Y>"] = ctactions.copy_cheat_value,
                        ["<C-E>"] = ctactions.edit_user_cheatsheet
                    }
                }
            )
        end
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify"
        }
    },
    -- auto session plugin
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup(
                {
                    auto_restore_enabled = true,
                    auto_session_suppress_dirs = {"~/", "/"}
                }
            )
        end
    },
    -- bufferline (windows tabs)
    {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"}
}
