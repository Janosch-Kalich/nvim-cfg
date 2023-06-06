require('aerial').setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>N', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '<leader>n', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
