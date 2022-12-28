local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() require "configs.tokyonight" end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    config = function() require "configs.treesitter" end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        config = function() require "configs.mason" end,
      }
    },
    event = "InsertEnter",
    config = function() require "configs.mason-lspconfig" end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require "configs.lualine" end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function() require "configs.neo-tree" end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    },
    event = "InsertEnter",
    config = function() require "configs.cmp" end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function() require "configs.gitsigns" end,
  },

  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = function() require "configs.nvim-surround" end,
  },

  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function() require "configs.comment" end,
  },

  {
    "folke/which-key.nvim",
    config = function() require "configs.which-key" end,
  },

  {
    "slim-template/vim-slim",
    ft = "slim",
  }
}
