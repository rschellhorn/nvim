vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.server_capabilities.codeActionProvider then
      vim.keymap.set('n', '<leader>la', "<cmd>:CodeActionMenu<cr>", { noremap=true, silent=true, buffer=bufnr, desc = "Code Action" })
    end

    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { noremap=true, silent=true, buffer=bufnr, desc = "Format" })
    end

    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc = "Definition" })
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { noremap=true, silent=true, buffer=bufnr, desc = "Hover" })
    vim.keymap.set('n', '<leader>lj', "<cmd>:Telescope lsp_references<cr>", { noremap=true, silent=true, buffer=bufnr, desc = "References" })
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { noremap=true, silent=true, buffer=bufnr, desc = "Rename" })

    ---
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc = "Definition" })
    vim.keymap.set('n', 'gr', "<cmd>:Telescope lsp_references<cr>", { noremap=true, silent=true, buffer=bufnr, desc = "References" })
    vim.keymap.set('n', '?', vim.lsp.buf.hover, { noremap=true, silent=true, buffer=bufnr, desc = "Hover" })

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
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      capabilities = capabilities
    }
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the 'vim', 'use' global
            globals = {'vim', 'use', 'require'},
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {enable = false}
        }
      }
    })
  end
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)
