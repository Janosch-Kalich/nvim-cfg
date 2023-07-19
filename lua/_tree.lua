require("nvim-tree").setup({
    sort_by = "case_sensitive",
    filters = {
    dotfiles = false,
    },
    git = {
        enable = false,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 1000,
    }
})
