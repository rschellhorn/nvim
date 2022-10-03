local cmp_status_ok, neotest = pcall(require, "neotest")
if not cmp_status_ok then
  return
end

neotest.setup {
  adapters = {
    require('neotest-rspec')
  },
  icons = {
    passed = "",
    running = "",
    failed = "",
    unknown = "",
  }
}
