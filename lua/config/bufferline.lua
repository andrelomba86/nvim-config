-- require("bufferline").setup(
--     {
--         options = {
--             mode = "buffers",
--             indicator = {
--                 style = "underline" -- estilo VSCode: linha inferior
--             }
--         }
--     }
-- )
--

require("bufferline").setup(
    {
        options = {
            mode = "buffers", -- estilo VSCode (não abas reais)
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            indicator = {
                style = "underline" -- estilo VSCode: linha inferior
            },
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 18,
            max_prefix_length = 15,
            tab_size = 18,
            diagnostics = false, -- VSCode não mostra isso na aba por padrão
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            separator_style = "thin", -- bem limpo
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            hover = {
                enabled = true,
                delay = 150,
                reveal = {"close"}
            },
            sort_by = "insert_after_current"
        },
        highlights = {
            fill = {
                bg = "#1e1e1e" -- fundo VSCode dark
            },
            background = {
                bg = "#1e1e1e",
                fg = "#8a8a8a"
            },
            buffer_selected = {
                fg = "#ffffff",
                bg = "#252526",
                bold = true,
                italic = false
            },
            separator = {
                fg = "#1e1e1e",
                bg = "#1e1e1e"
            },
            indicator_selected = {
                fg = "#007acc" -- azul VSCode
            },
            modified_selected = {
                fg = "#f9c74f"
            }
        }
    }
)

vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", {silent = true})
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", {silent = true})
