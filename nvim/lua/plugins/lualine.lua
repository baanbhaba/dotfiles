return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local theme_file = vim.fn.expand("~/.config/hypr/.theme_current")
        local current_theme = "charcoal"
        if vim.fn.filereadable(theme_file) == 1 then
            current_theme = vim.fn.readfile(theme_file)[1]
        end

        local custom_theme = "auto"
        if current_theme == "charcoal" then
            custom_theme = {
                normal = {
                    a = { fg = "#080808", bg = "#ffb000", gui = "bold" },
                    b = { fg = "#ffb000", bg = "#181818" },
                    c = { fg = "#8c9b32", bg = "#080808" },
                },
                insert = {
                    a = { fg = "#080808", bg = "#ffd166", gui = "bold" },
                    b = { fg = "#ffd166", bg = "#181818" },
                    c = { fg = "#ffb000", bg = "#080808" },
                },
                visual = {
                    a = { fg = "#080808", bg = "#8c9b32", gui = "bold" },
                    b = { fg = "#8c9b32", bg = "#181818" },
                    c = { fg = "#8c9b32", bg = "#080808" },
                },
                replace = {
                    a = { fg = "#080808", bg = "#ff5c00", gui = "bold" },
                    b = { fg = "#ff5c00", bg = "#181818" },
                    c = { fg = "#ff5c00", bg = "#080808" },
                },
                command = {
                    a = { fg = "#080808", bg = "#ffb000", gui = "bold" },
                    b = { fg = "#ffb000", bg = "#181818" },
                    c = { fg = "#ffb000", bg = "#080808" },
                },
                inactive = {
                    a = { fg = "#444444", bg = "#080808" },
                    b = { fg = "#444444", bg = "#080808" },
                    c = { fg = "#444444", bg = "#080808" },
                },
            }
        elseif current_theme == "neobrutalism" then
            custom_theme = {
                normal = {
                    a = { fg = "#ffffff", bg = "#ff006e", gui = "bold" },
                    b = { fg = "#000000", bg = "#ffbe0b", gui = "bold" },
                    c = { fg = "#000000", bg = "#fffdf0" },
                },
                insert = {
                    a = { fg = "#000000", bg = "#00f5d4", gui = "bold" },
                    b = { fg = "#ffffff", bg = "#8338ec", gui = "bold" },
                    c = { fg = "#000000", bg = "#fffdf0" },
                },
                visual = {
                    a = { fg = "#000000", bg = "#ffbe0b", gui = "bold" },
                    b = { fg = "#ffffff", bg = "#ff006e", gui = "bold" },
                    c = { fg = "#000000", bg = "#fffdf0" },
                },
                inactive = {
                    a = { fg = "#666666", bg = "#e5e5e5" },
                    b = { fg = "#666666", bg = "#e5e5e5" },
                    c = { fg = "#666666", bg = "#e5e5e5" },
                },
            }
        elseif current_theme == "jaipur" then
            custom_theme = {
                normal = {
                    a = { fg = "#f5ede3", bg = "#c45a3c", gui = "bold" },
                    b = { fg = "#d4a847", bg = "#3b1010" },
                    c = { fg = "#f5ede3", bg = "#2d0a0a" },
                },
                insert = {
                    a = { fg = "#2d0a0a", bg = "#d4a847", gui = "bold" },
                    b = { fg = "#f5ede3", bg = "#3b1010" },
                    c = { fg = "#f5ede3", bg = "#2d0a0a" },
                },
                visual = {
                    a = { fg = "#f5ede3", bg = "#8a9a86", gui = "bold" },
                    b = { fg = "#d4a847", bg = "#3b1010" },
                    c = { fg = "#f5ede3", bg = "#2d0a0a" },
                },
                inactive = {
                    a = { fg = "#a0845c", bg = "#2d0a0a" },
                    b = { fg = "#a0845c", bg = "#2d0a0a" },
                    c = { fg = "#a0845c", bg = "#2d0a0a" },
                },
            }
        elseif current_theme == "colorblock" then
            custom_theme = {
                normal = {
                    a = { fg = "#f0ebe3", bg = "#c4a35a", gui = "bold" },
                    b = { fg = "#2d2d2d", bg = "#e4ded4" },
                    c = { fg = "#666666", bg = "#f0ebe3" },
                },
                insert = {
                    a = { fg = "#ffffff", bg = "#7a8fa0", gui = "bold" },
                    b = { fg = "#2d2d2d", bg = "#e4ded4" },
                    c = { fg = "#666666", bg = "#f0ebe3" },
                },
                visual = {
                    a = { fg = "#ffffff", bg = "#a89ab5", gui = "bold" },
                    b = { fg = "#2d2d2d", bg = "#e4ded4" },
                    c = { fg = "#666666", bg = "#f0ebe3" },
                },
                inactive = {
                    a = { fg = "#999999", bg = "#f0ebe3" },
                    b = { fg = "#999999", bg = "#f0ebe3" },
                    c = { fg = "#999999", bg = "#f0ebe3" },
                },
            }
        end

        require("lualine").setup({
            options = {
                theme = custom_theme,
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
            },
        })
    end,
}
