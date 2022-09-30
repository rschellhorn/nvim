return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use "tpope/vim-rails"
  use "ellisonleao/gruvbox.nvim"
  use "slim-template/vim-slim"

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
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    config = function()
      require("nvim-lsp-installer").setup()
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
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          signcolumn = 'no'
        },
        filters = {
          custom = {
            "^.git$",
            "^.vscode$"
          }
        }
      }
    end
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
end)
