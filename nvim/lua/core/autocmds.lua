local group = vim.api.nvim_create_augroup(
    "AmberTerminal",
    {}
)

-- Highlight when yanking
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        group = group,
        callback = function()
            vim.highlight.on_yank({
                timeout = 150
            })
        end,
    }
)

-- Remember cursor position
vim.api.nvim_create_autocmd(
    "BufReadPost",
    {
        group = group,
        callback = function()
            local pos = vim.fn.line("'\"")
            if pos > 0 and pos <= vim.fn.line("$") then
                vim.cmd('normal! g`"')
            end
        end,
    }
)
