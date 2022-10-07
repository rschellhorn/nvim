local ok, tree = pcall(require, "nvim-tree")
if not ok then
  return
end

tree.setup({
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
