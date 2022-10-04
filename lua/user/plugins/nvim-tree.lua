local ok, tree = pcall(require, "nvim-tree")
if not ok then
  return
end

tree.setup({
  close_if_last_window = false,
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
