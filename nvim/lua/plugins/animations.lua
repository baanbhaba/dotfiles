return {
    -- Animated Scope Indicator (Draws current function/block scope with animation)
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            symbol = "│",
            options = { try_as_border = true },
            draw = {
                delay = 50,
                animation = function(s, n)
                    return 8
                end,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "lazy", "mason", "neo-tree", "Trouble", "terminal" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    -- Animated Cursor Jump Beacon (Pulses a beacon on long cursor jumps)
    {
        "DanilaMihailov/beacon.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            enable = true,
            size = 14,
            fade = true,
            minimal_jump = 6,
            show_jumps = true,
        },
    },
}
