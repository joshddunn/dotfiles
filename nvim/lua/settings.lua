local lib = require("lib")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.opt.cmdheight = 2
vim.opt.expandtab = true
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.foldlevel = 99
vim.opt.ignorecase = true
vim.opt.matchtime = 2
vim.opt.modeline = false
vim.opt.number = true
vim.opt.pumheight = 20
vim.opt.relativenumber = true
vim.opt.scrolloff = 7
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undodir = lib.path("/.config/nvim/temp/undodir")
vim.opt.undofile = true
vim.opt.whichwrap = "b,s,<,>,h,l,[,]"
vim.opt.writebackup = false
