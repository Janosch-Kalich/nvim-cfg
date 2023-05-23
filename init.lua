vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('_lsp')
require('_cmp')
require('_treesitter')
require('_theme')
require('_lualine')
require('_session_manager')
require('_helper')
require('_tree')
require('_telescope')
require('_dap')
require('_tabs')
require('_minimap')

if vim.g.neovide then
    vim.o.guifont = 'CaskaydiaCove NF'
    vim.g.neovide_refresh_rate = 165
    vim.g.neovide_padding_top=0
    vim.g.neovide_padding_left=0
    vim.g.neovide_padding_right=0
    vim.g.neovide_padding_bottom=0
end

vim.opt.shiftwidth = 2
vim.wo.number = true
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.g.mapleader = ','

local builtin = require('telescope.builtin')
local dap = require('dap')
local dap_ui = require('dapui')

vim.keymap.set('n', '<leader>a', builtin.find_files, {})
vim.keymap.set('n', '<leader>y', builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', dap.continue, {})
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>k', dap.step_over, {})
vim.keymap.set('n', '<leader>j', dap.step_into, {})
vim.keymap.set('n', '<leader>m', dap_ui.toggle, {})

map('n', '<C-Tab>', '<Cmd>BufferNext<CR>', {})
map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', {})
map('n', '<A-w>', '<Cmd>BufferClose<CR>', {})
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', {})
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', {})
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', {})
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', {})
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', {})
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', {})
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', {})
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', {})
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', {})
map('n', '<A-0>', '<Cmd>BufferGoto 10<CR>', {})
map('n', '<leader>p', '<Cmd>BufferPick<CR>', {})

map('n', '<leader>q', ':NvimTreeToggle<CR>', {})

map('n', '<leader>ö', ':MinimapToggle<CR>', {})