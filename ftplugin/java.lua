--[[
local config = {
  cmd = { 'jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
}

require('jdtls').start_or_attach(config)
--]]

vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.keymap.set({'n'}, '<localleader>tc', '<Cmd>JavaTestRunCurrentClass<CR>')
vim.keymap.set({'n'}, '<localleader>tm', '<Cmd>JavaTestRunCurrentMethod<CR>')
vim.keymap.set({'n'}, '<localleader>rm', '<Cmd>JavaRunnerRunMain<CR>')
vim.keymap.set({'n'}, '<localleader>sm', '<Cmm>JavaRunnerStopMain<CR>')
vim.keymap.set({'n'}, '<localleader>tr', '<Cmm>JavaTestViewLastReport<CR>')
