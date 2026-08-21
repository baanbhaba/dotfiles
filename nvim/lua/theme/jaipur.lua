-- Jaipur
-- Warm royal earthy terracotta colorscheme

local colors = {
    bg = "#2d0a0a",
    bg_alt = "#3b1010",
    surface = "#360e0e",

    fg = "#f5ede3",
    fg_dim = "#a0845c",

    terracotta = "#c45a3c",
    gold = "#d4a847",
    sand = "#e6ccb2",
    rust = "#9c3d28",
    sage = "#8a9a86",

    border = "#c45a3c",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "jaipur"

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.surface })
set(0, "Cursor", { fg = colors.bg, bg = colors.gold })
set(0, "CursorLine", { bg = colors.bg_alt })
set(0, "CursorLineNr", { fg = colors.gold, bold = true })
set(0, "LineNr", { fg = colors.fg_dim })

-- Selection
set(0, "Visual", { bg = "#521818" })
set(0, "Search", { fg = colors.bg, bg = colors.gold })

-- Syntax
set(0, "Comment", { fg = colors.fg_dim, italic = true })
set(0, "String", { fg = colors.sand })
set(0, "Character", { fg = colors.sand })
set(0, "Number", { fg = colors.gold })
set(0, "Boolean", { fg = colors.gold })
set(0, "Keyword", { fg = colors.terracotta, bold = true })
set(0, "Statement", { fg = colors.terracotta })
set(0, "Function", { fg = colors.gold })
set(0, "Identifier", { fg = colors.fg })
set(0, "Type", { fg = colors.sand })
set(0, "Constant", { fg = colors.gold })

-- UI
set(0, "StatusLine", { fg = colors.fg, bg = colors.surface })
set(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
set(0, "FloatBorder", { fg = colors.border, bg = colors.surface })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.rust })
set(0, "DiagnosticWarn", { fg = colors.gold })
set(0, "DiagnosticInfo", { fg = colors.sand })
set(0, "DiagnosticHint", { fg = colors.sage })
