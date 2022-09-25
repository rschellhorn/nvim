-- Navigation
vim.keymap.set('n', '<cr>', ':nohlsearch<cr>')
vim.keymap.set('n', '<A-Left>', '<C-W>h')
vim.keymap.set('n', '<A-Down>', '<C-W>j')
vim.keymap.set('n', '<A-Up>', '<C-W>k')
vim.keymap.set('n', '<A-Right>', '<C-W>l')

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

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<cr>')

-- 
vim.keymap.set('n', '<leader>pb', require('telescope.builtin').git_branches, { desc = "Git branches" })
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = "Files" })
vim.keymap.set('n', '<leader>pp', require('telescope.builtin').live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>ps', require('telescope.builtin').grep_string, { desc = "Text under cursor" })
vim.keymap.set('n', '<leader>pt', require('telescope.builtin').spell_suggest, { desc = "Spelling" })
vim.keymap.set('n', '<leader>pw', require('telescope').extensions.project.project, { desc = "Projects" })

vim.keymap.set('n', '<leader>s', require('neotest').summary.toggle, { desc = "Tests" })
vim.keymap.set('n', '<leader>t', function()
    require('neotest').run.run()
    require('neotest').summary.open()
end)
