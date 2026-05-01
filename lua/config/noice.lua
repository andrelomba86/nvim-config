require("notify").setup(
    {
        background_colour = "#000000"
    }
)
require("noice").setup(
    {
        cmdline = {
            format = {
                cmdline = {title = ""},
                search_down = {title = ""},
                search_up = {title = ""},
                filter = {title = ""},
                lua = {title = ""},
                help = {title = ""},
                input = {title = ""}
            }
        },
				notify = {
					enabled = false
				},
        views = {
            cmdline_popup = {
                border = {
                    style = "single"
                    -- padding = {1, 2}
                },
                position = {
                    row = 4,
                    col = "50%"
                },
                size = {
                    width = 80,
                    height = "auto"
                }
                -- filter_options = {},
                -- win_options = {
                -- winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
                -- }
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 7,
                    col = "50%"
                },
                size = {
                    width = 80,
                    height = 10
                },
                border = {
                    style = "rounded",
                    padding = {0, 1}
                },
                win_options = {
                    winhighlight = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}
                }
            }
        }
    }
)
