-- Amber Terminal IDE
-- Core bootstrap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("core.netrw")
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.plugins")
-- Dynamic Theme Loader (Charcoal/Amber, NeoBrutalism, Jaipur, ColorBlock)
local theme_file = vim.fn.expand("~/.config/hypr/.theme_current")
local current_theme = "amber_terminal"
if vim.fn.filereadable(theme_file) == 1 then
    local name = vim.fn.readfile(theme_file)[1]
    if name == "charcoal" then
        current_theme = "theme.amber_terminal"
    elseif name == "neobrutalism" then
        current_theme = "theme.neobrutalism"
    elseif name == "jaipur" then
        current_theme = "theme.jaipur"
    elseif name == "colorblock" then
        current_theme = "theme.colorblock"
    end
end
pcall(require, current_theme)

require("theme.plugins")
require("core.workspace")
