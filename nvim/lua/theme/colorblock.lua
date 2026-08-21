-- Color Block
-- Muted light minimalist colorscheme

local colors = {
    bg = "#f0ebe3",
    bg_alt = "#e4ded4",
    surface = "#f7f4ee",

    fg = "#2d2d2d",
    fg_dim = "#666666",

    accent = "#c4a35a",
    blue = "#7a8fa0",
    lavender = "#a89ab5",
    rose = "#b58d8d",
    olive = "#8a9675",

    border = "#a89ab5",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "colorblock"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = "#ffffff", bg = colors.accent })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.accent, bold = true })
set(0, "LineNr", { fg = colors.fg_dim })

-- Selection
set(0, "Visual", { bg = "#ded4c3" })
set(0, "Search", { fg = "#ffffff", bg = colors.accent })

-- Syntax
set(0, "Comment", { fg = colors.fg_dim, italic = true })
set(0, "String", { fg = colors.olive })
set(0, "Character", { fg = colors.olive })
set(0, "Number", { fg = colors.lavender })
set(0, "Boolean", { fg = colors.lavender })
set(0, "Keyword", { fg = colors.rose, bold = true })
set(0, "Statement", { fg = colors.rose })
set(0, "Function", { fg = colors.blue })
set(0, "Identifier", { fg = colors.fg })
set(0, "Type", { fg = colors.accent })
set(0, "Constant", { fg = colors.lavender })

-- UI
set(0, "StatusLine", { fg = colors.fg, bg = colors.surface })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface })
