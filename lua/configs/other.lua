local status_ok, other = pcall(require, "other-nvim")
if not status_ok then return end

other.setup {
  mappings = {
    "rails",
  },
}

vim.api.nvim_set_keymap("n", "<leader>jo", "<cmd>:Other<CR>", { noremap = true, silent = true })
