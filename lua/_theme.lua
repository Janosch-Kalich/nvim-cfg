require('nightfox').setup({
  options = {
    transparent = true
  }
})

vim.cmd('colorscheme carbonfox')

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = false,
  },
  cursorword = {
    enable = false,
  }
}
