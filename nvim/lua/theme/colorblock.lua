-- Color Block
-- Vibrant geometric minimalist colorscheme

local colors = {
    bg = "#f2ede4",
    bg_alt = "#e5decf",
    surface = "#faf7f2",

    fg = "#1e2022",
    fg_dim = "#7a7065",

    accent = "#e5a93c",
    blue = "#4d7c8a",
    lavender = "#8e7ca8",
    rose = "#d96b52",
    olive = "#5c7c64",

    border = "#e5a93c",
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
set(0, "Search", { fg = "#1e2022", bg = colors.accent })

-- Syntax
set(0, "Comment", { fg = colors.fg_dim, italic = true })
set(0, "String", { fg = colors.olive })
set(0, "Character", { fg = colors.olive })
set(0, "Number", { fg = colors.lavender })
set(0, "Boolean", { fg = colors.lavender })
set(0, "Keyword", { fg = colors.rose, bold = true })
set(0, "Statement", { fg = colors.rose })
set(0, "Function", { fg = colors.blue, bold = true })
set(0, "Identifier", { fg = colors.fg })
set(0, "Type", { fg = colors.accent, bold = true })
set(0, "Constant", { fg = colors.lavender })

-- UI
set(0, "StatusLine", { fg = colors.fg, bg = colors.surface })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.rose, bold = true })
set(0, "DiagnosticWarn", { fg = colors.accent, bold = true })
set(0, "DiagnosticInfo", { fg = colors.blue })
set(0, "DiagnosticHint", { fg = colors.olive })
