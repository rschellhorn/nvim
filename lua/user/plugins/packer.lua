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
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight'
        }
      }
    end
  }

  use {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup {
        style = "night"
      }
      vim.cmd [[colorscheme tokyonight]]
    end
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
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
      "nvim-neotest/neotest-plenary",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "suketa/nvim-dap-ruby"
    },
    config = function()
      require("dap-ruby").setup()
      require("neotest").setup {
        adapters = {
          require("neotest-plenary"),
          require('neotest-rspec'),
        },
        icons = {
          passed = "",
          running = "",
          failed = "",
          unknown = "",

          expanded = "",
          child_prefix = "",
          child_indent = "  ",
          final_child_prefix = "",
          non_collapsible = "",
          collapsed = "",
        }
      }
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    requires = {
      "RRethy/nvim-treesitter-endwise",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/playground",
      "p00f/nvim-ts-rainbow"
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            show_hidden_count = false,
          },
          use_libuv_file_watcher = true,
        },
        buffers = {
          follow_current_file = true,
        },
        source_selector = {
          winbar = true,
        },
        window = {
          position = "left",
          width = 40,
        }
      })
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
      require 'telescope'.load_extension('project')
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
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
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
