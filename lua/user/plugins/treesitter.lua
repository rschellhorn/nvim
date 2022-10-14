require('nvim-treesitter.configs').setup {
  ensure_installed = { "elixir", "lua", "ruby", "typescript", "yaml" },
  context_commentstring = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  rainbow = {
    enable = false,
  },
}
