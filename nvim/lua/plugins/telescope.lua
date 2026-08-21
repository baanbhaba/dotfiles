return {
    {
        "nvim-telescope/telescope.nvim",

        branch = "0.1.x",

        cmd = "Telescope",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            {
                "<leader>f",
                "<cmd>Telescope find_files<CR>",
                desc = "Find files",
            },

            {
                "<leader>s",
                "<cmd>Telescope live_grep<CR>",
                desc = "Search project",
            },

            {
                "<leader>b",
                "<cmd>Telescope buffers<CR>",
                desc = "Buffers",
            },
        },

        config = function()

            require("telescope").setup({

                defaults = {

                    sorting_strategy = "ascending",

                    layout_config = {
                        prompt_position = "top",
                    },

                    preview = {
                        treesitter = false,
                    },

                },

            })

        end,
    },
}
