return {
    {
        "epwalsh/obsidian.nvim",

        version = "*",

        lazy = true,

        cmd = {
            "ObsidianQuickSwitch",
            "ObsidianSearch",
            "ObsidianBacklinks",
            "ObsidianToday",
            "ObsidianNew",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            {
                "<leader>os",
                "<cmd>ObsidianQuickSwitch<CR>",
                desc = "Search notes",
            },

            {
                "<leader>ob",
                "<cmd>ObsidianBacklinks<CR>",
                desc = "Backlinks",
            },

            {
                "<leader>on",
                "<cmd>ObsidianNew<CR>",
                desc = "New note",
            },
        },

        opts = {
            workspaces = {
                {
                    name = "workspaces",
                    path = "/run/media/" .. vim.env.USER .. "/External/6. Common/workspaces",
                },
            },

            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
        },
    },
}
