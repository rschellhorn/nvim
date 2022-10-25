-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "syntax"
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.shiftwidth = 2
-- vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.softtabstop = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 500
vim.opt.wrap = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
