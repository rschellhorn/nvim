local status_ok, neotest = pcall(require, "neotest")
if not status_ok then return end

require("dap-ruby").setup()

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
    child_indent = "  ",
    final_child_prefix = "",
    non_collapsible = "",
    collapsed = "",
  }
}
