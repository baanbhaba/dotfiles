return {

    {
        "nvim-treesitter/nvim-treesitter",

        branch = "main",

        lazy = false,

        build = ":TSUpdate",

        config = function()

            require("nvim-treesitter").setup()

            local languages = {
                "c",
                "cpp",
                "python",
                "rust",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "bash",
                "lua",
                "java",
                "sql",
            }


            vim.api.nvim_create_autocmd("FileType", {

                callback = function()

                    local ok =
                        pcall(vim.treesitter.start)

                    if not ok then
                        return
                    end

                end,

            })

        end,

    },

}
