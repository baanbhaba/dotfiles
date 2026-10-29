-- RetroBoy Theme
-- Authentic GameBoy DMG 4-Shade Dot-Matrix Neovim Colorscheme

local colors = {
    bg = "#0f380f",
    bg_alt = "#164616",
    surface = "#1b521b",

    fg = "#9bbc0f",
    fg_dim = "#8bac0f",

    accent = "#8bac0f",
    accent_bright = "#9bbc0f",
    olive = "#306230",
    dark = "#0f380f",

    border = "#306230",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "retroboy"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = colors.dark, bg = colors.accent_bright })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.accent_bright, bold = true })
set(0, "LineNr", { fg = colors.olive, bold = true })

-- Selection
set(0, "Visual", { bg = colors.accent, fg = colors.dark })
set(0, "Search", { fg = colors.dark, bg = colors.accent_bright, bold = true })

-- Syntax
set(0, "Comment", { fg = colors.olive, italic = true })
set(0, "String", { fg = colors.accent_bright, bold = true })
set(0, "Character", { fg = colors.accent_bright })
set(0, "Number", { fg = colors.accent, bold = true })
set(0, "Boolean", { fg = colors.accent, bold = true })
set(0, "Keyword", { fg = colors.accent_bright, bold = true })
set(0, "Statement", { fg = colors.accent_bright, bold = true })
set(0, "Function", { fg = colors.accent, bold = true })
set(0, "Identifier", { fg = colors.fg, bold = true })
set(0, "Type", { fg = colors.accent_bright, bold = true })
set(0, "Constant", { fg = colors.accent, bold = true })

-- UI
set(0, "StatusLine", { fg = colors.dark, bg = colors.accent, bold = true })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface, bold = true })
set(0, "VertSplit", { fg = colors.border, bold = true })
set(0, "WinSeparator", { fg = colors.border, bold = true })

-- Popup menu
set(0, "Pmenu", { fg = colors.fg, bg = colors.surface })
set(0, "PmenuSel", { fg = colors.dark, bg = colors.accent, bold = true })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.accent })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.accent, bold = true })
set(0, "DiagnosticWarn", { fg = colors.accent, bold = true })
set(0, "DiagnosticInfo", { fg = colors.accent_bright, bold = true })
set(0, "DiagnosticHint", { fg = colors.fg_dim, bold = true })
