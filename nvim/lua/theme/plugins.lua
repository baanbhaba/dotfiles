local set = vim.api.nvim_set_hl

local theme_name = vim.g.colors_name or "amber_terminal"

local palettes = {
    amber_terminal = {
        bg = "#000000",
        surface = "#111111",
        fg = "#d6d6d6",
        muted = "#777777",
        accent = "#ffb000",
        accent_dim = "#8c6200",
        border = "#262626",
        sel_bg = "#ffb000",
        sel_fg = "#000000",
        green = "#8fbf7f",
        red = "#c97b7b",
    },
    charcoal = {
        bg = "#000000",
        surface = "#111111",
        fg = "#d6d6d6",
        muted = "#777777",
        accent = "#ffb000",
        accent_dim = "#8c6200",
        border = "#262626",
        sel_bg = "#ffb000",
        sel_fg = "#000000",
        green = "#8fbf7f",
        red = "#c97b7b",
    },
    jaipur = {
        bg = "#2d0a0a",
        surface = "#360e0e",
        fg = "#f5ede3",
        muted = "#a0845c",
        accent = "#d4a847",
        accent_dim = "#c45a3c",
        border = "#c45a3c",
        sel_bg = "#c45a3c",
        sel_fg = "#f5ede3",
        green = "#8a9a86",
        red = "#9c3d28",
    },
    colorblock = {
        bg = "#f2ede4",
        surface = "#faf7f2",
        fg = "#1e2022",
        muted = "#7a7065",
        accent = "#e5a93c",
        accent_dim = "#8e7ca8",
        border = "#e5a93c",
        sel_bg = "#e5a93c",
        sel_fg = "#1e2022",
        green = "#5c7c64",
        red = "#d96b52",
    },
    neobrutalism = {
        bg = "#fffdf0",
        surface = "#ffffff",
        fg = "#000000",
        muted = "#666666",
        accent = "#ff006e",
        accent_dim = "#8338ec",
        border = "#000000",
        sel_bg = "#ffbe0b",
        sel_fg = "#000000",
        green = "#38b000",
        red = "#ff006e",
    },
    sketchbook = {
        bg = "#f8f9fa",
        surface = "#ffffff",
        fg = "#18181b",
        muted = "#71717a",
        accent = "#18181b",
        accent_dim = "#2563eb",
        border = "#d4d4d8",
        sel_bg = "#e4e4e7",
        sel_fg = "#18181b",
        green = "#16a34a",
        red = "#dc2626",
    },
    retroboy = {
        bg = "#0f380f",
        surface = "#1b521b",
        fg = "#9bbc0f",
        muted = "#306230",
        accent = "#8bac0f",
        accent_dim = "#9bbc0f",
        border = "#306230",
        sel_bg = "#8bac0f",
        sel_fg = "#0f380f",
        green = "#8bac0f",
        red = "#9bbc0f",
    },
}

local colors = palettes[theme_name] or palettes.amber_terminal

-- Bufferline
set(0, "BufferLineFill", { bg = colors.bg })
set(0, "BufferLineBackground", { fg = colors.muted, bg = colors.bg })
set(0, "BufferLineBufferSelected", { fg = colors.accent, bg = colors.surface, bold = true })
set(0, "BufferLineSeparator", { fg = colors.bg, bg = colors.bg })
set(0, "BufferLineSeparatorSelected", { fg = colors.bg, bg = colors.surface })

-- Telescope
set(0, "TelescopeNormal", { fg = colors.fg, bg = colors.surface })
set(0, "TelescopeBorder", { fg = colors.border, bg = colors.surface })
set(0, "TelescopePromptBorder", { fg = colors.accent, bg = colors.surface })
set(0, "TelescopePromptNormal", { fg = colors.fg, bg = colors.surface })
set(0, "TelescopeSelection", { fg = colors.sel_fg, bg = colors.sel_bg, bold = true })

-- Neo-tree
set(0, "NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
set(0, "NeoTreeNormalNC", { fg = colors.muted, bg = colors.bg })
set(0, "NeoTreeDirectoryName", { fg = colors.accent, bold = true })
set(0, "NeoTreeRootName", { fg = colors.accent, bold = true })
set(0, "NeoTreeFileName", { fg = colors.fg })
set(0, "NeoTreeFileIcon", { fg = colors.accent_dim })

-- Completion / Popup Menu
set(0, "Pmenu", { fg = colors.fg, bg = colors.surface })
set(0, "PmenuSel", { fg = colors.sel_fg, bg = colors.sel_bg, bold = true })
set(0, "PmenuSbar", { bg = colors.bg })
set(0, "PmenuThumb", { bg = colors.border })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.red, bold = true })
set(0, "DiagnosticWarn", { fg = colors.accent, bold = true })
set(0, "DiagnosticHint", { fg = colors.green })
set(0, "DiagnosticInfo", { fg = colors.accent_dim })
