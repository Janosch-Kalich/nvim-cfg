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
require('_workspaces')
require('_aerial')
require('_litee')
require('_http')
require('_hop')
require('_autopairs')
require('_blankline')
require('_webtools')
require('_numb')
require('_reach')
require('_knap')

if vim.g.neovide then
    vim.o.guifont = 'CaskaydiaCove NF'
    vim.g.neovide_scale_factor = 0.8
    vim.g.neovide_refresh_rate = 165
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_left = 10
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_no_idle = true
    vim.g.neovide_fullscreen = true
    --vim.g.neovide_profiler = true
end

vim.opt.shiftwidth = 2
vim.wo.number = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.wo.relativenumber = true

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
--[[autocmd('VimEnter', { pattern = '*', command = 'silent !tmux set status off' })
autocmd('VimLeave', {
  pattern = '*',
  callback = function()
    vim.fn.jobstart('tmux set status on', { detach = true })
  end
})]]--
 
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

if (vim.loop.os_uname().sysname == 'Linux') then
  vim.g.floaterm_shell = 'zsh'
elseif (vim.loop.os_uname().sysname == 'Windows') then
  vim.g.floaterm_shell = 'pwsh'
end

local builtin = require('telescope.builtin')
local dap = require('dap')
local dap_ui = require('dapui')
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader>a', builtin.find_files, {})
vim.keymap.set('n', '<leader>y', builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', dap.continue, {})
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>k', dap.step_over, {})
vim.keymap.set('n', '<leader>j', dap.step_into, {})
vim.keymap.set('n', '<leader>m', dap_ui.toggle, {})
vim.keymap.set('n', '<leader>ss', vim.lsp.buf.hover, {})

vim.keymap.set('n', '<leader>x', '<cmd>AerialToggle!<CR>', {})
vim.keymap.set('n', '<leader>r', '<Plug>RestNvim<CR>', {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set('n', '<leader>hw', hop.hint_words, {})
vim.keymap.set('v', '<leader>hw', hop.hint_words, {})
vim.keymap.set('n', '<leader>hl', hop.hint_lines_skip_whitespace, {})
vim.keymap.set('v', '<leader>hl', hop.hint_lines_skip_whitespace, {})
vim.keymap.set('n', '<leader>ha', hop.hint_anywhere, {})
vim.keymap.set('v', '<leader>ha', hop.hint_anywhere, {})
vim.keymap.set('n', '<leader>hp', hop.hint_patterns, {})
vim.keymap.set('v', '<leader>hp', hop.hint_patterns, {})

map('n', '<C-v>', '"+p', {})
map('n', '<C-c>', '"+yi', {})

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

map('n', '<leader>t', ':FloatermToggle<CR>', {})

map('t', '<Esc>', '<C-\\><C-n>', {})

vim.keymap.set('n', '<leader>rb', function()
  require('reach').buffers({
    auto_handles = vim.split('jfkdlshgurnciemxow', '')
  })
end, {})

vim.keymap.set({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

require'alpha'.setup(require'alpha.themes.startify'.config)
