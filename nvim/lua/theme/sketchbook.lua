-- Sketchbook
-- Crisp Paper & Graphite Neovim colorscheme

local colors = {
    bg = "#f8f9fa",
    bg_alt = "#f0f1f3",
    surface = "#ffffff",

    fg = "#18181b",
    fg_dim = "#71717a",

    charcoal = "#18181b",
    lead = "#27272a",
    lead_mid = "#52525b",
    lead_light = "#a1a1aa",

    blue = "#2563eb",
    red = "#dc2626",
    green = "#16a34a",
    amber = "#b45309",
    purple = "#7c3aed",
    cyan = "#0891b2",

    border = "#d4d4d8",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "sketchbook"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = "#ffffff", bg = colors.charcoal })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.charcoal, bold = true })
set(0, "LineNr", { fg = colors.lead_light })

-- Selection
set(0, "Visual", { bg = "#e4e4e7" })
set(0, "Search", { fg = "#ffffff", bg = colors.charcoal, bold = true })
set(0, "IncSearch", { fg = "#ffffff", bg = colors.blue, bold = true })

-- Syntax
set(0, "Comment", { fg = colors.fg_dim, italic = true })
set(0, "String", { fg = colors.green })
set(0, "Character", { fg = colors.green })
set(0, "Number", { fg = colors.amber, bold = true })
set(0, "Boolean", { fg = colors.amber, bold = true })
set(0, "Keyword", { fg = colors.purple, bold = true })
set(0, "Statement", { fg = colors.purple, bold = true })
set(0, "Function", { fg = colors.blue, bold = true })
set(0, "Identifier", { fg = colors.fg })
set(0, "Type", { fg = colors.cyan, bold = true })
set(0, "Constant", { fg = colors.amber, bold = true })
set(0, "PreProc", { fg = colors.purple })
set(0, "Special", { fg = colors.cyan })

-- UI
set(0, "StatusLine", { fg = colors.fg, bg = colors.surface, bold = true })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface })
set(0, "VertSplit", { fg = colors.border })
set(0, "WinSeparator", { fg = colors.border })

-- Popup menu
set(0, "Pmenu", { fg = colors.fg, bg = colors.surface })
set(0, "PmenuSel", { fg = "#ffffff", bg = colors.charcoal, bold = true })
set(0, "PmenuSbar", { bg = colors.bg_alt })
set(0, "PmenuThumb", { bg = colors.border })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.red, bold = true })
set(0, "DiagnosticWarn", { fg = colors.amber, bold = true })
set(0, "DiagnosticInfo", { fg = colors.blue, bold = true })
set(0, "DiagnosticHint", { fg = colors.green, bold = true })
