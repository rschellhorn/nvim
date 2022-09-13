return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'ellisonleao/gruvbox.nvim'
	use 'sheerun/vim-polyglot'
	use 'stevearc/dressing.nvim'
	use {
		'williamboman/nvim-lsp-installer',
		'neovim/nvim-lspconfig'
	}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

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
			'nvim-telescope/telescope-project.nvim'
		}
	}

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp'
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
