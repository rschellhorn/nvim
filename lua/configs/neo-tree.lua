local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then return end

neo_tree.setup {
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      show_hidden_count = false,
    },
    use_libuv_file_watcher = true,
  },
  buffers = {
    follow_current_file = true,
    show_unloaded = true,
  },
  source_selector = {
    winbar = true,
  },
  window = {
    position = "left",
    width = 40,
  }
}
