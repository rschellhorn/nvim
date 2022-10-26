local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

wk.setup {
  plugins = {
    spelling = { enabled = true },
    presets = { operators = false },
  },
  window = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
}

wk.register({
  ["<esc>"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  b = {
    name = "Buffers",
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
  },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  d = {
    name = "Debug",
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
  },
  l = {
    name = "LSP",
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  s = {
    name = "Search",
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    c = { function() require("telescope.builtin").grep_string() end, "Word under cursor" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    o = { function() require("telescope.builtin").oldfiles() end, "History" },
    p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    w = { function() require("telescope.builtin").live_grep() end, "Search words" }
  },
  t = {
    name = "Tests",
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    e = { '<cmd>TermExec cmd="s %"<cr>', "Execute" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
    o = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
  w = {
    name = "Windows",
    b = { "<cmd>Neotree source=buffers<cr>", "Buffers" },
    e = { "<cmd>Neotree toggle<CR>", "Explorer" },
    g = { "<cmd>Neotree source=git_status<cr>", "Git" },
    t = { "<cmd>ToggleTerm<cr>", "Terminal" },
    o = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Tests" },
  }
}, { prefix = "<leader>" })
