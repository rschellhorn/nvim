local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then return end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then return end

local cmp_nvim_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_status_ok then return end

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup {

}

mason_lspconfig.setup_handlers {
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
