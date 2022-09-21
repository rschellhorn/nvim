-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamed'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'syntax'
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = 'yes'
vim.opt.softtabstop = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false

require('plugins')

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      }
    }
  }
}

require('neotest').setup {
  adapters = {
    require('neotest-rspec')
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'ruby', 'typescript' },
  context_commentstring = {
    enable = true
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { 'ruby' }
  },
  endwise = {
    enable = true
  }
}


require('telescope').setup {
  defaults = {},
  extensions = {
    project = {
      base_dirs = {
        '~/code',
      }
    }
  }
}

local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' }
  })
})

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>j', require('telescope.builtin').lsp_references, bufopts)
  vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rf', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, bufopts)

  -- Server capabilities spec:
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
        group = "lsp_document_highlight",
        desc = "Document Highlight",
      })
    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
        group = "lsp_document_highlight",
        desc = "Clear All the References",
      })
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig')['solargraph'].setup {
	on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
  capabilities = capabilities
}

require('mappings')
vim.cmd([[colorscheme gruvbox]])
