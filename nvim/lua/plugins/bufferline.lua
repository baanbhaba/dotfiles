return {
    {
        "akinsho/bufferline.nvim",

        version = "*",

        event = "VeryLazy",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()

            require("bufferline").setup({

                options = {

                    mode = "buffers",

                    numbers = "none",

                    close_command = "bdelete! %d",

                    right_mouse_command = "bdelete! %d",

                    left_mouse_command = "buffer %d",

                    middle_mouse_command = nil,

                    separator_style = "slant",

                    always_show_bufferline = true,

                    show_buffer_close_icons = true,

                    show_close_icon = false,

                    diagnostics = "nvim_lsp",

                }

            })

        end,
    },
}
