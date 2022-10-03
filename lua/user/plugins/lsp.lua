local on_attach = function(client, bufnr)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { noremap=true, silent=true, buffer=bufnr, desc = "Code Action" })
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { noremap=true, silent=true, buffer=bufnr, desc = "Defenition" })
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { noremap=true, silent=true, buffer=bufnr, desc = "Format" })
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { noremap=true, silent=true, buffer=bufnr, desc = "Hover" })
  vim.keymap.set('n', '<leader>lj', vim.lsp.buf.references, { noremap=true, silent=true, buffer=bufnr, desc = "References" })
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { noremap=true, silent=true, buffer=bufnr, desc = "Rename" })

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

local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      on_attach = on_attach,
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
