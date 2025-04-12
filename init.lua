local os = vim.loop.os_uname().sysname

local cfg = require('cfg')

-- vim.g {{{1

vim.g.mapleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vimtex_view_method = 'mupdf'
vim.g.maplocalleader = ','
vim.g.floaterm_shell = cfg.floaterm_shell[os]

-- }}}

require('plugins')

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

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.foldmethod = 'marker'

-- }}}

-- vim.wo {{{1

vim.wo.relativenumber = true
vim.wo.number = true

--- }}}

vim.filetype.add {
  extension = {
    fasm = 'fasm',
    jasm = 'jasm',
    jir = 'jir'
  }
}

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true
})

function curl_download() 
  vim.ui.input({ prompt = 'Filename'}, function (filename)
    if filename ~= nil then
      vim.ui.input({ prompt = 'URL'}, function (url)
        if url ~= nil then
          vim.system({'curl', '-o', filename, url}):wait()
        end
      end)
    end
  end)
end

-- KEYMAPS {{{1

vim.keymap.set('n', '<leader>2', curl_download)

-- LSP {{{2
vim.keymap.set('n', '<localleader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<localleader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<localleader>r', vim.lsp.buf.references)
vim.keymap.set('n', '<localleader>c', vim.lsp.buf.code_action)
-- }}}

-- Aerial {{{2
vim.keymap.set('n', '<leader>x', '<cmd>AerialToggle!<CR>')
-- }}}

-- Rest {{{2
vim.keymap.set('n', '<leader>rn', '<Plug>RestNvim<CR>')
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

-- Floaterm {{{2
vim.keymap.set({'n'}, '<leader>t', ':FloatermToggle<CR>')
vim.keymap.set({'t'}, '<Esc>', '<C-\\><C-n>')
-- }}}

vim.keymap.set({'n'}, '<leader>1', ':Neogit<CR>')

-- Oil {{{2
vim.keymap.set({'n'}, '<leader>o', '<cmd>:Oil<CR>')
-- }}}

-- Session manager {{{2
vim.keymap.set({'n'}, '<leader>sm', '<Cmd>SessionManager load_session<CR>')
-- }}}

-- }}}
