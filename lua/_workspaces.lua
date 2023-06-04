require('workspaces').setup({
    sort = true,
    mru_sort = true,
    auto_open = true,
})

local telescope = require('telescope')
telescope.load_extension('workspaces')