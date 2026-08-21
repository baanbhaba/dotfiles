return {
    {
        "MeanderingProgrammer/render-markdown.nvim",

        ft = {
            "markdown",
        },

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            {
                "<leader>p",
                "<cmd>RenderMarkdown toggle<CR>",
                desc = "Toggle markdown preview",
            },
        },

        config = function()
            require("render-markdown").setup({

                enabled = true,

                render_modes = {
                    "n",
                    "c",
                    "t",
                },

                heading = {
                    enabled = true,
                    sign = true,
                    icons = {
                        "󰉫 ",
                        "󰉬 ",
                        "󰉭 ",
                        "󰉮 ",
                        "󰉯 ",
                        "󰉰 ",
                    },
                },

                checkbox = {
                    enabled = true,

                    unchecked = {
                        icon = "󰄱",
                    },

                    checked = {
                        icon = "󰱒",
                    },

                    custom = {
                        todo = {
                            raw = "[-]",
                            rendered = "󰥔",
                            highlight = "RenderMarkdownWarn",
                        },
                    },
                },

                code = {
                    enabled = true,
                    style = "full",
                    border = "thin",
                },

                bullet = {
                    enabled = true,
                    icons = {
                        "●",
                        "○",
                        "◆",
                        "◇",
                    },
                },

                pipe_table = {
                    enabled = true,
                    style = "full",
                },

            })
        end,
    },
}
