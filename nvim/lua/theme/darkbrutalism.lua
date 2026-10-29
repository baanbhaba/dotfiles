-- Dark Brutalism Theme
-- High-contrast graphic dark Neovim colorscheme

local colors = {
    bg = "#0c0d12",
    bg_alt = "#161821",
    surface = "#1b1e28",

    fg = "#ffffff",
    fg_dim = "#9ca3af",

    pink = "#ff006e",
    cyan = "#00f5d4",
    yellow = "#ffe600",
    purple = "#a855f7",
    green = "#22c55e",
    orange = "#f97316",

    border = "#ffe600",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "darkbrutalism"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = "#000000", bg = colors.yellow })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.yellow, bold = true })
set(0, "LineNr", { fg = "#555b6e", bold = true })

-- Selection
set(0, "Visual", { bg = colors.yellow, fg = "#000000" })
set(0, "Search", { fg = "#000000", bg = colors.yellow, bold = true })

-- Syntax
set(0, "Comment", { fg = "#6b7280", italic = true })
set(0, "String", { fg = colors.green, bold = true })
set(0, "Character", { fg = colors.green })
set(0, "Number", { fg = colors.cyan, bold = true })
set(0, "Boolean", { fg = colors.cyan, bold = true })
set(0, "Keyword", { fg = colors.pink, bold = true })
set(0, "Statement", { fg = colors.pink, bold = true })
set(0, "Function", { fg = colors.purple, bold = true })
set(0, "Identifier", { fg = colors.fg, bold = true })
set(0, "Type", { fg = colors.cyan, bold = true })
set(0, "Constant", { fg = colors.orange, bold = true })

-- UI
set(0, "StatusLine", { fg = "#000000", bg = colors.yellow, bold = true })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface, bold = true })
set(0, "VertSplit", { fg = colors.border, bold = true })
set(0, "WinSeparator", { fg = colors.border, bold = true })

-- Popup menu
set(0, "Pmenu", { fg = colors.fg, bg = colors.surface })
set(0, "PmenuSel", { fg = "#000000", bg = colors.yellow, bold = true })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.yellow })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.pink, bold = true })
set(0, "DiagnosticWarn", { fg = colors.orange, bold = true })
set(0, "DiagnosticInfo", { fg = colors.cyan, bold = true })
set(0, "DiagnosticHint", { fg = colors.green, bold = true })
