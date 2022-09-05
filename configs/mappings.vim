""""
" b - buffer
" c - change
" f - find
" g - git
" t - test
" w - window

" Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Remap return to clear search highlight
nnoremap <cr> :nohlsearch<cr>

" Directly switch between open splitted windows
map <A-Down> <C-W>j
map <A-Left> <C-W>h
map <A-Up> <C-W>k
map <A-Right> <C-W>l

" Splits
nnoremap <leader>vs <C-w>v<cr>
nnoremap <leader>vh <C-w>s<cr>

" Terminal
nmap <silent><leader>wt :VTerm<cr>

" Telescope
nnoremap <leader>cs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <leader>fd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

" NERDTree
nnoremap <leader>/ :NvimTreeToggle<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

" Vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
