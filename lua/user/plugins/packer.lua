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
  use "wbthomason/packer.nvim"

  use "tpope/vim-rails"
  use "slim-template/vim-slim"

  use "ellisonleao/gruvbox.nvim"

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons"
  }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }

  use {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "antoinemadec/FixCursorHold.nvim",
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "suketa/nvim-dap-ruby"
    },
    config = function()
      require('dap-ruby').setup()
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    requires = {
      "RRethy/nvim-treesitter-endwise",
      "JoosepAlviste/nvim-ts-context-commentstring"
    }
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons"
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-project.nvim',
    },
    config = function()
      require('telescope').load_extension('gh')
      require'telescope'.load_extension('project')
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
