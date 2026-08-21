-- Amber Terminal IDE
-- Core bootstrap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("core.netrw")
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.plugins")
require("theme.amber_terminal")

require("theme.plugins")
require("core.workspace")
