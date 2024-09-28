local os = vim.loop.os_uname().sysname

-- REQUIRES {{{1

require('plugins')

local aerial = require('aerial')
local alpha = require('alpha')
local alpha_themes_startify = require('alpha.themes.startify')
local barbar = require('barbar')
local cmp = require('cmp')
local cursorline = require('nvim-cursorline')
local dap = require('dap')
local dapui = require('dapui')
local fidget = require('fidget')
local flutter_tools = require('flutter-tools')
local hex = require('hex')
local hop = require('hop')
local hop_hint = require('hop.hint')
local java = require('java')
local knap = require('knap')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_nvim_dap = require('mason-nvim-dap')
local litee_bookmarks = require('litee.bookmarks')
local litee_lib = require('litee.lib')
local litee_symboltree = require('litee.symboltree')
local lsp_lines = require('lsp_lines')
local nable = require('nabla')
local neorg = require('neorg')
local nightfox = require('nightfox')
local numb = require('numb')
local oil = require('oil')
local plantuml = require('plantuml')
local reach = require('reach')
local session_manager = require('session_manager')
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local treesitter_configs = require('nvim-treesitter.configs')
local treesitter_install = require('nvim-treesitter.install')
local workspaces = require('workspaces')

local cfg = require('cfg')
local dap_cfg = require('_dap')

-- }}}

-- vim.g {{{1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vimtex_view_method = 'mupdf'
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.knap_settings = cfg.knap
vim.g.floaterm_shell = cfg.floaterm_shell[os]

-- }}}

-- SETUP {{{1

require('_lsp')
dap_cfg[os]()

aerial.setup(cfg.aerial)
alpha.setup(alpha_themes_startify.config)
barbar.setup(cfg.barbar)
cmp.setup(cfg.cmp)
cursorline.setup(cfg.cursorline)
dapui.setup()
fidget.setup()
flutter_tools.setup()
hex.setup()
hop.setup(cfg.hop)
java.setup()
mason.setup()
mason_lspconfig.setup()
mason_nvim_dap.setup(cfg.mason_nvim_dap)
litee_bookmarks.setup()
litee_lib.setup()
litee_symboltree.setup()
lsp_lines.setup()
neorg.setup(cfg.neorg)
nightfox.setup(cfg.nightfox)
numb.setup()
oil.setup(cfg.oil)
plantuml.setup(cfg.plantuml)
reach.setup(cfg.reach)
session_manager.setup(cfg.session_manager)
telescope.setup()
treesitter_configs.setup(cfg.treesitter_configs)
treesitter_install.compilers = cfg.treesitter_install_compilers[os]
workspaces.setup(cfg.workspaces)

telescope.load_extension('workspaces')
telescope.load_extension('aerial')

require('bubbles')

-- }}}

-- NEOVIDE {{{1

if vim.g.neovide then
  vim.o.guifont = 'CommitMono'
  vim.g.neovide_scale_factor = 1
  vim.g.neovide_refresh_rate = 300
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_left = 10
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_no_idle = true
  --vim.g.neovide_fullscreen = true
  --vim.g.neovide_profiler = true
end

-- }}}

-- vim.opt {{{1

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.foldmethod = 'marker'

-- }}}

-- vim.wo {{{1

vim.wo.relativenumber = true
vim.wo.number = true

--- }}}

vim.cmd('colorscheme carbonfox')

vim.filetype.add {
  extension = {
    fasm = 'fasm'
  }
}

vim.diagnostic.config({
  virtual_text = false
})

-- KEYMAPS {{{1

-- Telescope {{{2
vim.keymap.set('n', '<leader>a', telescope_builtin.find_files)
vim.keymap.set('n', '<leader>y', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>e', "<Cmd>Telescope workspaces<CR>")
-- }}}

-- DAP {{{2
vim.keymap.set('n', '<leader>l', dap.continue)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>k', dap.step_over)
vim.keymap.set('n', '<leader>j', dap.step_into)
vim.keymap.set('n', '<leader>m', dapui.toggle)
-- }}}

-- LSP {{{2
vim.keymap.set('n', '<leader>ss', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>dd', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
-- }}}

-- Aerial {{{2
vim.keymap.set('n', '<leader>x', '<cmd>AerialToggle!<CR>')
-- }}}

-- Rest {{{2
vim.keymap.set('n', '<leader>rn', '<Plug>RestNvim<CR>')
-- }}}

-- Hop {{{2
vim.keymap.set('', '<leader>hw', hop.hint_words)
vim.keymap.set('', '<leader>he', function()
  hop.hint_words {
    hint_position = hop_hint.HintPosition.END
  }
end)
vim.keymap.set('', '<leader>hl', hop.hint_lines_skip_whitespace)
vim.keymap.set('', '<leader>ha', hop.hint_anywhere)
vim.keymap.set('', '<leader>hp', hop.hint_patterns)
-- }}}

-- Tab {{{2
vim.keymap.set({'n'}, '<C-Tab>', '<Cmd>BufferNext<CR>')
vim.keymap.set({'n'}, '<C-S-Tab>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set({'n'}, '<A-w>', '<Cmd>BufferClose<CR>')
vim.keymap.set({'n'}, '<A-1>', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set({'n'}, '<A-2>', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set({'n'}, '<A-3>', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set({'n'}, '<A-4>', '<Cmd>BufferGoto 4<CR>')
vim.keymap.set({'n'}, '<A-5>', '<Cmd>BufferGoto 5<CR>')
vim.keymap.set({'n'}, '<A-6>', '<Cmd>BufferGoto 6<CR>')
vim.keymap.set({'n'}, '<A-7>', '<Cmd>BufferGoto 7<CR>')
vim.keymap.set({'n'}, '<A-8>', '<Cmd>BufferGoto 8<CR>')
vim.keymap.set({'n'}, '<A-9>', '<Cmd>BufferGoto 9<CR>')
vim.keymap.set({'n'}, '<A-0>', '<Cmd>BufferGoto 10<CR>')
vim.keymap.set({'n'}, '<leader>p', '<Cmd>BufferPick<CR>')
-- }}}

-- Tree {{{3
vim.keymap.set({'n'}, '<leader>q', ':NvimTreeToggle<CR>')

-- Floaterm
vim.keymap.set({'n'}, '<leader>t', ':FloatermToggle<CR>')
vim.keymap.set({'t'}, '<Esc>', '<C-\\><C-n>')

-- Reach
vim.keymap.set('n', '<leader>w', function()
  reach.buffers {
    auto_handles = vim.split('jfkdlshgurnciemxow,ypq.<', '')
  }
end)
-- }}}

-- Knap {{{2
vim.keymap.set({ 'n', 'v', 'i' },'<F5>', knap.process_once)
-- }}}

-- Oil {{{2
vim.keymap.set({'n'}, '<leader>o', '<cmd>:Oil<CR>')
-- }}}

-- Nabla {{{2
vim.keymap.set({'n'}, '<leader>nv', nable.toggle_virt)
-- }}}

-- Session manager {{{2
vim.keymap.set({'n'}, '<leader><leader>', '<Cmd>SessionManager load_session<CR>')
-- }}}

-- }}}
