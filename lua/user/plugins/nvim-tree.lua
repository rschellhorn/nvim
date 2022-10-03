local ok, file_explorer = pcall(require, "nvim-tree")
if not ok then
  return
end

file_explorer.setup({
  close_if_last_window = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  view = {
    signcolumn = 'no'
  },
  filters = {
    custom = {
      "^.git$",
      "^.vscode$"
    }
  },
  update_focused_file = {
    enable = true,
  }
})
