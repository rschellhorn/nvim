local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/lua/packer_compiled.lua"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  require("packer").packadd = "packer.nvim"
end

local Packer = augroup("packer_user_config", { clear = true })

-- Automatically re-compile packer whenever you save packer.lua
autocmd("BufWritePost", {
  callback = function()
    vim.cmd [[ source <afile> | PackerCompile ]]
  end,
  group = Packer,
  pattern = "packer.lua",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer_compiled_ok, _ = pcall(require, "packer_compiled")
if not packer_compiled_ok then
  vim.notify_once("Please Run :PackerCompile", vim.log.levels.INFO)
end

packer.init {
  compile_path = compile_path,
}

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function() require "configs.noice" end,
  }

  use {
    "slim-template/vim-slim"
  }

  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = function() require "configs.indent-blankline" end
  }

  use {
    "scalameta/nvim-metals",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require "configs.metals" end,
  }

  use {
    "rgroli/other.nvim",
    config = function() require "configs.other" end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require "configs.lualine" end,
  }

  use {
    "folke/tokyonight.nvim",
    config = function() require "configs.tokyonight" end,
  }

  -- Built-in LSP
  use {
    "neovim/nvim-lspconfig",
  }

  -- Package Manager
  use {
    "williamboman/mason.nvim",
    config = function() require "configs.mason" end,
  }

  -- LSP manager
  use {
    "williamboman/mason-lspconfig.nvim",
    after = { "mason.nvim", "nvim-lspconfig" },
    config = function() require "configs.mason-lspconfig" end,
  }

  -- Formatting and linting
  use {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufEnter",
    config = function() require "configs.null-ls" end,
  }

  -- null-ls manager
  use {
    "jayp0521/mason-null-ls.nvim",
    after = { "mason.nvim", "null-ls.nvim" },
    config = function() require "configs.mason-null-ls" end,
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require "configs.trouble" end,
  }

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  use {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function() require "configs.toggleterm" end,
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function() require "configs.nvim-surround" end,
  }

  use {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function() require "configs.comment" end,
  }

  use {
    "stevearc/dressing.nvim",
    event = "UIEnter",
    config = function() require "configs.dressing" end,
  }

  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap"
    },
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "antoinemadec/FixCursorHold.nvim",
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-plenary",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "suketa/nvim-dap-ruby"
    },
    config = function() require "configs.neotest" end,
  }

  use { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
  use { "nvim-treesitter/playground", after = "nvim-treesitter" }
  use {
    "nvim-treesitter/nvim-treesitter",
    branch = "v0.8.0",
    run = "TSUpdate",
    event = "BufEnter",
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function() require "configs.treesitter" end,
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function() require "configs.neo-tree" end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
    config = function() require "configs.telescope" end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    },
    config = function() require "configs.cmp" end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function() require "configs.gitsigns" end,
  }

  use {
    "folke/which-key.nvim",
    config = function() require "configs.which-key" end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
