require "user.options"
require "user.keymaps"
require "user.diagnostics"
require "user.plugins"

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]
