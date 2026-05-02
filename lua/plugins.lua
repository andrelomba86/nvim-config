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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<space>e", "<cmd>Neotree filesystem reveal left<CR>", desc = "Abrir explorer" },
            { "<C-b>", "<cmd>Neotree filesystem toggle left<CR>", desc = "Alternar sidebar" },
            { "<space><space>f", "<cmd>Neotree filesystem reveal left<CR>", desc = "Revelar arquivo" },
        },
        config = function()
            require("config.neotree")
        end
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
    },
    {
        "sindrets/diffview.nvim",
        cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewFileHistory"},
        dependencies = {"nvim-lua/plenary.nvim"},
        keys = {
            {"<space>gv", "<cmd>DiffviewOpen<CR>", desc = "Diffview open"},
            {"<space>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview file history"},
            {"<space>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview repo history"},
            {"<space>gc", "<cmd>DiffviewClose<CR>", desc = "Diffview close"},
        },
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
        keys = {
            {"<space>gg", "<cmd>Neogit<CR>", desc = "Neogit Status"},
            {"<space>gm", "<cmd>Neogit commit<CR>", desc = "Neogit Commit"},
            {"<space>gP", "<cmd>Neogit pull<CR>", desc = "Neogit Pull"},
            {"<space>gU", "<cmd>Neogit push<CR>", desc = "Neogit Push"},
        },
        config = function()
            require("config.neogit").setup()
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
