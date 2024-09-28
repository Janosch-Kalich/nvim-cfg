local cmp = require('cmp')
local luasnip = require('luasnip')
local plenary_path = require('plenary.path')
local session_manager_config = require('session_manager.config')

local cfg = {}

-- NEORG {{{1
cfg.neorg = {
   load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = vim.env.NOTES_DIR
        }
      }
    }
  }
}
-- }}}

-- PLANTUML {{{1
cfg.plantuml = {
  renderer = {
    type = 'image',
    options = {
      prog = 'feh',
      dark_mode = true
    }
  }
}
-- }}}

-- REACH {{{1
cfg.reach = {
  notifications = false
}
-- }}}

-- NIGHTFOX {{{1
cfg.nightfox = {
  options = {
    transparent = true
  }
}
-- }}}

-- CURSORLINE {{{1
cfg.cursorline = {
  cursorline = {
    enable = true,
    timeout = 0,
    number = false,
  },
  cursorword = {
    enable = false,
  }
}
-- }}}

-- OIL {{{1
cfg.oil = {
  default_file_explorer = true,
  columns = {
    'icon'
  },
  keymaps = {
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },
  }
}
-- }}}

-- BARBAR {{{1
cfg.barbar = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  clickable = true,
  focus_on_close = 'previous',
  hightlight_alternate = false,
  hightlight_visible = false,
  insert_at_end = true,
  maximum_padding = 2,
  icons = {
    button = ''
  }
}
-- }}}

-- KNAP {{{1
cfg.knap = {
  texoutputtext = "pdf",
  textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
  textopdfviewerlaunch = "mupdf %outputfile%",
  textopdfviewerrefresh = "kill -HUP %pid%"
}
-- }}}

-- WORKSPACES {{{1
cfg.workspaces = {
  sort = true,
  mru_sort = true,
  auto_open = true,
  hooks = {
    open = { "SessionManager load_current_dir_session" }
  }
}
-- }}}

-- HOP {{{1
cfg.hop = {
  multi_windows = true
}
-- }}}

-- FLOATERM {{{1
cfg.floaterm_shell = {
  Linux = 'fish',
  Windows_NT = 'nu'
}
-- }}}

-- AERIAL {{{1
cfg.aerial = {
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>N', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '<leader>n', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
}
-- }}}

-- CMP {{{1
cfg.cmp = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = function()
      if cmp.visible() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
      else
        cmp.complete()
      end
    end,
    ['<C-k>'] = function()
      if cmp.visible() then
        cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
      else
        cmp.complete()
      end
    end,
    ['<C-h>'] = cmp.mapping.abort(),
    ['<C-l>'] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  }
}
-- }}}

-- MASON NVIM DAP {{{1
cfg.mason_nvim_dap = {
  handlers = {}
}
-- }}}

-- TREESITTER CONFIGS {{{1
cfg.treesitter_configs = {
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
-- }}}

-- TREESITTER INSTALL COMPILERS {{{1
cfg.treesitter_install_compilers = {
  Linux = { 'gcc' },
  Windows_NT = { 'clang' }
}
-- }}}

cfg.session_manager = {
  sessions_dir = plenary_path:new(vim.fn.stdpath('data'), 'sessions'),
  path_replacer = '__',
  colon_replacer = '++',
  autoload_mode = session_manager_config.AutoloadMode.CurrentDir,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_dirs = {},
  autosave_ignore_filetypes = {
    'gitcommit',
  },
  autosave_ignore_buftypes = {},
  autosave_only_in_session = false,
  max_path_length = 80,
}

return cfg
