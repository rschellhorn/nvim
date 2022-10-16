local cmp_status_ok, neotest = pcall(require, "neotest")
if not cmp_status_ok then
  return
end

neotest.setup {
  adapters = {
    require("neotest-plenary"),
    require('neotest-rspec'),
  },
  icons = {
    passed = "",
    running = "",
    failed = "",
    unknown = "",

    expanded = "",
    child_prefix = "",
    child_indent = "",
    final_child_prefix = "",
    non_collapsible = "",
    collapsed = "",
  }
}
