require('workspaces').setup({
  sort = true,
  mru_sort = true,
  auto_open = true,
  hooks = {
    open = { "SessionManager load_current_dir_session" }
  }
})

local telescope = require('telescope')
telescope.load_extension('workspaces')
