local map = vim.keymap.set

local opts = {
    noremap = true,
    silent = true
}

-- Save / quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Clear search
map("n", "<Esc>", ":noh<CR>", opts)

-- Better movement
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected text
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Terminal
map("n", "<leader>t", ":terminal<CR>", opts)

-- Reload config
map(
    "n",
    "<leader>r",
    ":source $MYVIMRC<CR>",
    opts
)
