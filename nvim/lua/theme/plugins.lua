local set = vim.api.nvim_set_hl


local colors = {

    bg = "#000000",
    surface = "#111111",

    fg = "#d6d6d6",
    muted = "#777777",

    amber = "#ffb000",
    amber_dim = "#8c6200",

    green = "#8fbf7f",
    red = "#c97b7b",

}


-- Bufferline

set(0, "BufferLineFill", {
    bg = colors.bg,
})

set(0, "BufferLineBackground", {
    fg = colors.muted,
    bg = colors.bg,
})

set(0, "BufferLineBufferSelected", {
    fg = colors.amber,
    bg = colors.surface,
    bold = true,
})

set(0, "BufferLineSeparator", {
    fg = colors.bg,
    bg = colors.bg,
})


-- Telescope

set(0, "TelescopeNormal", {
    fg = colors.fg,
    bg = colors.surface,
})

set(0, "TelescopeBorder", {
    fg = colors.amber_dim,
    bg = colors.surface,
})

set(0, "TelescopePromptBorder", {
    fg = colors.amber,
    bg = colors.surface,
})

set(0, "TelescopeSelection", {
    fg = colors.bg,
    bg = colors.amber,
})


-- Neo-tree

set(0, "NeoTreeNormal", {
    fg = colors.fg,
    bg = colors.bg,
})

set(0, "NeoTreeDirectoryName", {
    fg = colors.amber,
})

set(0, "NeoTreeRootName", {
    fg = colors.amber,
    bold = true,
})


-- Completion

set(0, "Pmenu", {
    fg = colors.fg,
    bg = colors.surface,
})

set(0, "PmenuSel", {
    fg = colors.bg,
    bg = colors.amber,
})


-- Diagnostics

set(0, "DiagnosticError", {
    fg = colors.red,
})

set(0, "DiagnosticHint", {
    fg = colors.green,
})
