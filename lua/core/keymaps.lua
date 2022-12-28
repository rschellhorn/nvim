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
