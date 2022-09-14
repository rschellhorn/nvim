return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-rails'
	use 'ellisonleao/gruvbox.nvim'
	use 'sheerun/vim-polyglot'
	use 'stevearc/dressing.nvim'

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
		'williamboman/nvim-lsp-installer',
		'neovim/nvim-lspconfig'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'RRethy/nvim-treesitter-endwise'
		}
	}

	use {
  	'kyazdani42/nvim-tree.lua',
  	requires = {
    	'kyazdani42/nvim-web-devicons'
  	}
	}

	use {
  	'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-github.nvim'
		},
		config = function()
			require('telescope').load_extension('gh')
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
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'tanvirtin/vgit.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons'
		}
	}
end)
