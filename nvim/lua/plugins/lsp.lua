return {

    {
        "williamboman/mason.nvim",

        cmd = "Mason",

        config = function()
            require("mason").setup()
        end,

    },


    {
        "williamboman/mason-lspconfig.nvim",

        dependencies = {
            "neovim/nvim-lspconfig",
        },

        config = function()

            require("mason-lspconfig").setup({

                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    "rust_analyzer",
                    "ts_ls",
                    "jdtls",
                },

            })


            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()


            local servers = {
                lua_ls = {},
                pyright = {},
                clangd = {},
                rust_analyzer = {},
                ts_ls = {},
                jdtls = {},
            }


            for name, config in pairs(servers) do

                vim.lsp.config(name, {
                    capabilities = capabilities,
                    settings = config,
                })

                vim.lsp.enable(name)

            end


        end,

    },

}
