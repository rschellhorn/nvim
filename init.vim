lua <<EOF
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded = 1
	vim.g.loaded_netrwPlugin = 1
EOF

" Import Plugins
source $HOME/.config/nvim/configs/plugs.vim

source $HOME/.config/nvim/configs/nvim_tree.lua

" Import default configurations
source $HOME/.config/nvim/configs/defaults.vim

" Import lsp configurations
source $HOME/.config/nvim/configs/lsp.lua

" Mappings
source $HOME/.config/nvim/configs/mappings.vim

" Autocomplete
source $HOME/.config/nvim/configs/autocomplete.lua

lua <<EOF
	require("nvim-tree").setup()
	require'telescope'.load_extension('project')
EOF

" ===========================
" Starting options
" ===========================

" Theme
colorscheme gruvbox
