-- Neo-Brutalism Light Mode
-- High-contrast graphic Neovim colorscheme

local colors = {
    bg = "#fffdf0",
    bg_alt = "#f4f0db",
    surface = "#ffffff",

    fg = "#000000",
    fg_dim = "#444444",

    pink = "#ff006e",
    cyan = "#00bbf9",
    yellow = "#ffbe0b",
    purple = "#8338ec",
    green = "#38b000",
    orange = "#fb5607",

    border = "#000000",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "neobrutalism"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = "#ffffff", bg = colors.pink })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.pink, bold = true })
set(0, "LineNr", { fg = "#888888", bold = true })

-- Selection
set(0, "Visual", { bg = colors.yellow, fg = colors.fg })
set(0, "Search", { fg = "#ffffff", bg = colors.pink, bold = true })

-- Syntax
set(0, "Comment", { fg = "#666666", italic = true })
set(0, "String", { fg = colors.green, bold = true })
set(0, "Character", { fg = colors.green })
set(0, "Number", { fg = colors.purple, bold = true })
set(0, "Boolean", { fg = colors.purple, bold = true })
set(0, "Keyword", { fg = colors.pink, bold = true })
set(0, "Statement", { fg = colors.pink, bold = true })
set(0, "Function", { fg = colors.purple, bold = true })
set(0, "Identifier", { fg = colors.fg, bold = true })
set(0, "Type", { fg = colors.cyan, bold = true })
set(0, "Constant", { fg = colors.orange, bold = true })

-- UI
set(0, "StatusLine", { fg = "#ffffff", bg = colors.pink, bold = true })
set(0, "StatusLineNC", { fg = colors.fg, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface, bold = true })
set(0, "VertSplit", { fg = colors.border, bold = true })
set(0, "WinSeparator", { fg = colors.border, bold = true })

-- Popup menu
set(0, "Pmenu", { fg = colors.fg, bg = colors.surface })
set(0, "PmenuSel", { fg = "#ffffff", bg = colors.pink, bold = true })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.yellow })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.pink, bold = true })
set(0, "DiagnosticWarn", { fg = colors.orange, bold = true })
set(0, "DiagnosticInfo", { fg = colors.cyan, bold = true })
set(0, "DiagnosticHint", { fg = colors.green, bold = true })
