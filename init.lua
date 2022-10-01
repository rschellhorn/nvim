-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamed'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'syntax'
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = 'yes'
vim.opt.softtabstop = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.wrap = false

require('plugins')

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
      }
    },
    show_close_icon = false,
    separator_style = 'thin'
  }
}

require('neotest').setup {
  adapters = {
    require('neotest-rspec')
  },
  icons = {
    passed = "",
    running = "",
    failed = "",
    unknown = "",
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'ruby', 'typescript' },
  context_commentstring = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { 'ruby' }
  },
  highlight = {
    enable = true,
    disable = { 'ruby' }
  },
  endwise = {
    enable = true
  }
}

require('telescope').setup {
  defaults = {},
  extensions = {
    project = {
      base_dirs = {
        '~/code',
      }
    }
  }
}

require("chain")
require("autocomplete")
require("mappings")
vim.cmd([[colorscheme gruvbox]])
