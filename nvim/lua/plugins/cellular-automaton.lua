return {
    "eandrju/cellular-automaton.nvim",
    lazy = false,
    keys = {
        { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain (melt code animation)" },
        { "<leader>rain", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain (melt code animation)" },
        { "<leader>gol", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life animation" },
    },
}
