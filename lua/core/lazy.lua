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
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function() require "configs.kanagawa" end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    keys = {
      { "<leader>Ti", ":TSConfigInfo<cr>", "Info" },
    },
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
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function() require "configs.lualine" end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    keys = {
      { "<leader>wb", "<cmd>Neotree source=buffers<cr>", desc = "Buffers" },
      { "<leader>we", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
      { "<leader>wg", "<cmd>Neotree source=git_status<cr>", desc = "Git" },
    },
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function() require "configs.neo-tree" end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep Word" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
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
    keys = {
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
      { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
      { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
      { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
      { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
      { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
      { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
    },
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
