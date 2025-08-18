
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

--file settings 
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true --after restarting nvim you can still undo changes

--search settings
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

--UI and Visuals
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.hlsearch = true
vim.opt.clipboard:append("unnamedplus")

vim.opt.mouse = "a"
vim.g.editorconfig = true

