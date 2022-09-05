
-- empty setup using defaults
require("nvim-tree").setup {
  filters = {
    custom = {
      "^.git$",
      "^.vscode$"
    }
  }
}

require('lualine').setup()
