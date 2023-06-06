require('nightfox').setup({
  options = {
    transparent = true
  }
})

vim.cmd('colorscheme carbonfox')

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 100,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
