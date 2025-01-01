local ht = require('haskell-tools')

vim.keymap.set('n', '<localleader>rf', function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end)
