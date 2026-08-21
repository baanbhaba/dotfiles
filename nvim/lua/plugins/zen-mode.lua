return {
    {
        "folke/zen-mode.nvim",

        cmd = "ZenMode",

        keys = {
            {
                "<leader>z",
                "<cmd>ZenMode<CR>",
                desc = "Zen mode",
            },
        },

        config = function()
            require("zen-mode").setup({
                window = {
                    width = 90,
                    options = {
                        number = true,
                        relativenumber = true,
                    },
                },

                plugins = {
                    options = {
                        enabled = true,
                        ruler = true,
                        showcmd = false,
                    },

                    twilight = {
                        enabled = false,
                    },

                    gitsigns = {
                        enabled = false,
                    },

                    tmux = {
                        enabled = false,
                    },
                },
            })
        end,
    },
}
