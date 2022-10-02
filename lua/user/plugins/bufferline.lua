local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        padding = 1,
      }
    },
    show_close_icon = false,
    separator_style = "thin"
  }
}
