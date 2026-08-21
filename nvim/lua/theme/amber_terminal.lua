-- Amber Terminal
-- Personal Neovim colorscheme

local colors = {
    bg = "#000000",
    bg_alt = "#0a0a0a",
    surface = "#111111",

    fg = "#d6d6d6",
    fg_dim = "#8a8a8a",

    amber = "#ffb000",
    amber_soft = "#d99400",
    amber_dim = "#8c6200",

    cream = "#f5deb3",
    green = "#8fbf7f",
    cyan = "#7fbdbd",
    blue = "#7aa2f7",
    purple = "#b48ead",

    red = "#c97b7b",
    yellow = "#d6b36a",

    border = "#262626",
}

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "amber_terminal"

local set = vim.api.nvim_set_hl


-- Editor

set(0, "Normal", {
    fg = colors.fg,
    bg = colors.bg
})

set(0, "NormalFloat", {
    fg = colors.fg,
    bg = colors.surface
})

set(0, "Cursor", {
    fg = colors.bg,
    bg = colors.amber
})

set(0, "CursorLine", {
    bg = "#0d0d0d"
})

set(0, "CursorLineNr", {
    fg = colors.amber,
    bold = true
})

set(0, "LineNr", {
    fg = "#444444"
})


-- Selection

set(0, "Visual", {
    bg = "#3a2900"
})

set(0, "Search", {
    fg = colors.bg,
    bg = colors.amber
})


-- Syntax

set(0, "Comment", {
    fg = "#777777",
    italic = true
})

set(0, "String", {
    fg = colors.cream
})

set(0, "Character", {
    fg = colors.cream
})

set(0, "Number", {
    fg = colors.amber_soft
})

set(0, "Boolean", {
    fg = colors.amber_soft
})

set(0, "Keyword", {
    fg = colors.amber,
    bold = true
})

set(0, "Statement", {
    fg = colors.amber
})

set(0, "Function", {
    fg = colors.green
})

set(0, "Identifier", {
    fg = colors.fg
})

set(0, "Type", {
    fg = colors.yellow
})

set(0, "Constant", {
    fg = colors.amber_soft
})


-- UI

set(0, "StatusLine", {
    fg = colors.fg,
    bg = colors.surface
})

set(0, "StatusLineNC", {
    fg = colors.fg_dim,
    bg = colors.bg_alt
})

set(0, "FloatBorder", {
    fg = colors.amber_dim,
    bg = colors.surface
})


-- Popup menu

set(0, "Pmenu", {
    fg = colors.fg,
    bg = colors.surface
})

set(0, "PmenuSel", {
    fg = colors.bg,
    bg = colors.amber
})

set(0, "PmenuSbar", {
    bg = colors.surface
})

set(0, "PmenuThumb", {
    bg = colors.amber_dim
})


-- Diagnostics

set(0, "DiagnosticError", {
    fg = colors.red
})

set(0, "DiagnosticWarn", {
    fg = colors.yellow
})

set(0, "DiagnosticInfo", {
    fg = colors.blue
})

set(0, "DiagnosticHint", {
    fg = colors.green
})


-- Diff

set(0, "DiffAdd", {
    bg = "#102010"
})

set(0, "DiffDelete", {
    bg = "#201010"
})

set(0, "DiffChange", {
    bg = "#201b05"
})
