-- Amber Terminal IDE
-- Core bootstrap

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("core.netrw")
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.plugins")
-- Dynamic Theme Loader
local function apply_system_theme()
    local theme_file = vim.fn.expand("~/.config/hypr/.theme_current")
    local module_name = "theme.amber_terminal"
    local raw_theme = "charcoal"
    if vim.fn.filereadable(theme_file) == 1 then
        local lines = vim.fn.readfile(theme_file)
        if #lines > 0 and lines[1] ~= "" then
            raw_theme = vim.trim(lines[1])
        end
    end

    if raw_theme == "neobrutalism" then
        module_name = "theme.neobrutalism"
    elseif raw_theme == "darkbrutalism" then
        module_name = "theme.darkbrutalism"
    elseif raw_theme == "jaipur" then
        module_name = "theme.jaipur"
    elseif raw_theme == "colorblock" then
        module_name = "theme.colorblock"
    elseif raw_theme == "sketchbook" then
        module_name = "theme.sketchbook"
    elseif raw_theme == "retroboy" then
        module_name = "theme.retroboy"
    else
        module_name = "theme.amber_terminal"
    end

    if vim.g.loaded_system_theme ~= raw_theme then
        vim.g.loaded_system_theme = raw_theme
        package.loaded[module_name] = nil
        package.loaded["theme.plugins"] = nil
        pcall(require, module_name)
        pcall(require, "theme.plugins")
    end
end

apply_system_theme()

vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
    desc = "Auto-sync colors with active system theme on focus",
    callback = function()
        apply_system_theme()
    end,
})

vim.api.nvim_create_user_command("ThemeSync", apply_system_theme, {
    desc = "Sync Neovim theme with active system theme",
})

require("core.workspace")
