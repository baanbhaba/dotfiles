local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true

-- Tabs / indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.writebackup = false

-- Faster updates
opt.updatetime = 250
opt.timeoutlen = 400

-- Folding (Treesitter will improve this later)
opt.foldenable = true
opt.foldmethod = "indent"
opt.foldlevel = 99

-- Mouse support
opt.mouse = "a"

-- Better splits
opt.splitright = true
opt.splitbelow = true

-- Better completion behavior
opt.completeopt = {
    "menu",
    "menuone",
    "noselect"
}

-- Keep terminal cursor style
vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:hor20",
    "r-cr:hor20",
    "o:hor50"
}


-- System clipboard (Wayland)
vim.opt.clipboard = "unnamedplus"
