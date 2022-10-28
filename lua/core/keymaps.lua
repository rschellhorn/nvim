 -- Better window movement
vim.keymap.set('n', '<cr>', ':nohlsearch<cr>')
vim.keymap.set('n', '<A-Left>', '<C-W>h')
vim.keymap.set('n', '<A-Down>', '<C-W>j')
vim.keymap.set('n', '<A-Up>', '<C-W>k')
vim.keymap.set('n', '<A-Right>', '<C-W>l')

-- Save
vim.keymap.set("n", "<C-s>", "<c-u>:update<cr>")
vim.keymap.set("v", "<C-s>", "<c-c>:update<cr>")
vim.keymap.set("i", "<C-s>", "<c-o>:update<cr>")

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<A-Left>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<A-Down>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<A-Up>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<A-Right>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
