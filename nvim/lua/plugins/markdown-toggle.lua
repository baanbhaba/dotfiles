return {
    {
        "bngarren/checkmate.nvim",

        ft = {
            "markdown",
        },

        config = function()
            require("checkmate").setup({})
        end,

        keys = {
            {
                "<leader>x",
                function()
                    require("checkmate").toggle()
                end,
                desc = "Toggle checkbox",
            },
        },
    },
}
