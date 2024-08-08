require("oil").setup {
  default_file_explorer = true,
  columns = {
    "icon"
  },
  keymaps = {
    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
  }
}
