local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

treesitter.setup {
  ensure_installed = { "elixir", "lua", "ruby", "typescript", "yaml" },
  context_commentstring = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
}
