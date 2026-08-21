return {
    {
        "nvim-neo-tree/neo-tree.nvim",

        branch = "v3.x",

        cmd = "Neotree",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<CR>",
                desc = "Explorer",
            },
        },

        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,

                window = {
                    width = "fit_content",
                },

                filesystem = {
                    filtered_items = {
                        hide_dotfiles = true,
                    },
                },
            })
        end,
    },
}
