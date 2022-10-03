require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "ruby", "typescript", "yaml" },
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

