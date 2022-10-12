local ok, tree = pcall(require, "neo-tree")
if not ok then
  return
end

tree.setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      show_hidden_count = false,
    },
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
