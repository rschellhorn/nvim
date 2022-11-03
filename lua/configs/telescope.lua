local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

telescope.load_extension('gh')
telescope.load_extension('project')
telescope.setup {
  defaults = {},
  extensions = {
    project = {
      base_dirs = {
        '~/code',
      }
    }
  }
}
