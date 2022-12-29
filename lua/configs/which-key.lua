local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

wk.setup {
  plugins = {
    spelling = { enabled = true },
    presets = { operators = false },
  },
  window = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
}

wk.register({
  f = "Find",
  g = "Git",
  T = "Treesitter",
  w = "Windows",
}, { prefix = "<leader>" })
