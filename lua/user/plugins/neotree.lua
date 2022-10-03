local M = {}

M.config = function()
  local ok, file_explorer = pcall(require, "neo-tree")
  if not ok then
    return
  end

  file_explorer.setup({
    close_if_last_window = true,
  })
end

return M
