local os = vim.loop.os_uname().sysname

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- AERIAL {{{1
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    config = function()
      local telescope = require('telescope')
      local aerial = require('aerial')

      aerial.setup {
        on_attach = function(bufnr)
          vim.keymap.set('n', '<leader>N', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '<leader>n', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end
      }

      telescope.load_extension('aerial')
    end,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    }
  },
  -- }}}

  -- BARBAR {{{1
  {
    'romgrk/barbar.nvim',
    lazy = false,
    opts = {
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
  },
  -- }}}

  -- DRESSING {{{1
  {
    'stevearc/dressing.nvim',
    lazy = false,
    opts = {}
  },
  -- }}}

  -- FASM {{{1
  'fedorenchik/fasm.vim',
  {
    'j-hui/fidget.nvim',
    event = 'VeryLazy',
    opts = {}
  },
  -- }}}

  -- FLUTTER-TOOLS {{{1
  {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    opts = {}
  },
  -- }}}

  -- GITSIGNS !!! {{{1
  'lewis6991/gitsigns.nvim',
  -- }}}

  -- HASKELL-TOOLS {{{1
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
  },
  -- }}}

  -- HEX {{{1
  {
    'RaafatTurki/hex.nvim',
    event = 'VeryLazy',
    opts = {}
  },
  -- }}}

  -- HOP {{{1
  {
    'smoka7/hop.nvim',
    event = 'VeryLazy',
    config = function()
      local hop = require('hop')
      local hop_hint = require('hop.hint')

      hop.setup {
        multi_windows = true
      }

      vim.keymap.set('', '<leader>hw', hop.hint_words)
      vim.keymap.set('', '<leader>he', function()
        hop.hint_words {
          hint_position = hop_hint.HintPosition.END
        }
      end)
      vim.keymap.set('', '<leader>hl', hop.hint_lines_skip_whitespace)
      vim.keymap.set('', '<leader>ha', hop.hint_anywhere)
      vim.keymap.set('', '<leader>hp', hop.hint_patterns)
    end
  },
  -- }}}

  -- INDENT-BLANKLINE {{{1
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {}
  },
  -- }}}

  -- NVIM-JAVA {{{1
  {
    'nvim-java/nvim-java',
    ft = 'java'
  },
  --}}}

  -- KNAP {{{1
  {
    'frabjous/knap',
    ft = { 'tex', 'ltx', 'md' },
    init = function()
      vim.g.knap_settings = {
        texoutputtext = "pdf",
        textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
        textopdfviewerlaunch = "mupdf %outputfile%",
        textopdfviewerrefresh = "kill -HUP %pid%"
      }
    end,
    config = function()
      local knap = require('knap')

      vim.keymap.set({ 'n', 'v', 'i' },'<F5>', knap.process_once)
    end
  },
  -- }}}

  -- LEAN {{{1
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      -- you also will likely want nvim-cmp or some completion engine
    },

    -- see details below for full configuration options
    opts = {
      lsp = {},
      mappings = true,
    }
  },
  -- }}}

  -- LSP_LINES {{{1
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'VeryLazy',
    opts = {}
  },
  -- }}}

  -- LUA-UTILS {{{1
  'nvim-neorg/lua-utils.nvim',
  -- }}}

  -- LUALINE {{{1
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require('bubbles')
    end
  },
  -- }}}

  -- LUAROCKS {{{1
  {
    'vhyrro/luarocks.nvim',
    lazy = false
  },
  -- }}}

  -- LUASNIP {{{1
  'L3MON4D3/LuaSnip',
  -- }}}

  -- MARKDOWN-PREVIEW {{{1
  {
    'iamcco/markdown-preview.nvim',
    run = vim.fn['mkdp#util#install']
  },
  -- }}}

  -- MASON {{{1
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {}
  },
  -- }}}

  -- MASON-NVIM-DAP {{{1
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    }
  },
  -- }}}

  -- NABLA {{{1
  {
    'jbyuki/nabla.nvim',
    lazy = false,
    ft = 'md',
    config = function()
      local nable = require('nabla')
      vim.keymap.set({'n'}, '<leader>nv', nable.toggle_virt)
    end
  },
  -- }}}

  -- NEOCONF {{{1
  {
    'folke/neoconf.nvim',
    opts = {}
  },
  -- }}}

  -- NEOGIT {{{1
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      {
        'sindrets/diffview.nvim',
        opts = {
          key_bindings = {
            file_history_panel = { q = '<Cmd>DiffviewClose<CR>' },
            file_panel = { q = '<Cmd>DiffviewClose<CR>' },
            view = { q = '<Cmd>DiffviewClose<CR>' },
          }
        }
      }
    },
    config = true
  },
  -- }}}

  -- NEORG {{{1
  {
    'nvim-neorg/neorg',
    cmd = 'Neorg',
    lazy = false,
    opts = {
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
  },
  -- }}}

  -- NEOVIM-SESSION-MANAGER {{{1
  {
    'Shatur/neovim-session-manager',
    lazy = false,
    config = function()
      local plenary_path = require('plenary.path')
      local session_manager = require('session_manager')
      local session_manager_config = require('session_manager.config')

      session_manager.setup {
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
    end
  },
  -- }}}

  -- NUMB {{{1
  {
    'nacro90/numb.nvim',
    event = 'VeryLazy',
    opts = {}
  },
  -- }}}

  -- NIGHTFOX {{{1
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local nightfox = require('nightfox')

      nightfox.setup {
        options = {
          transparent = true
        }
      }

      vim.cmd('colorscheme carbonfox')
    end
  },
  -- }}}

  -- NVIM-CMP {{{1
  {
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup {
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
          ['<A-j>'] = function()
            if cmp.visible() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
            else
              cmp.complete()
            end
          end,
          ['<A-k>'] = function()
            if cmp.visible() then
              cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
            else
              cmp.complete()
            end
          end,
          ['<A-h>'] = cmp.mapping.abort(),
          ['<A-l>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        }
      }
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    }
  },
  -- }}}

  -- NVIM-CURSORLINE {{{1
  {
    'yamatsum/nvim-cursorline',
    event = 'VeryLazy',
    opts = {
      cursorline = {
        enable = true,
        timeout = 0,
        number = false,
      },
      cursorword = {
        enable = false,
      }
    }
  },
  -- }}}

  -- NVIM-DAP {{{1
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    config = function() 
      local dap_cfg = require('_dap')
      local dap = require('dap')

      dap_cfg[os]()

      vim.keymap.set('n', '<leader>l', dap.continue)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>k', dap.step_over)
      vim.keymap.set('n', '<leader>j', dap.step_into)
    end,
  },
  -- }}}

  -- NVIM-DAP-UI {{{1
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    config = function()
      local dapui = require('dapui')
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "repl", size = 0.25 },
              { id = "console", size = 0.75 }
            },
            size = 10,
            position = "bottom"
          },
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 }
            },
            size = 40,
            position = "left"
          }
        }
      })

      vim.keymap.set('n', '<leader>da', dapui.toggle)
      vim.keymap.set('n', '<leader>dj', function()
        dapui.toggle(1)
      end)
      vim.keymap.set('n', '<leader>dh', function()
        dapui.toggle(2)
      end)
    end,
  },
  -- }}}

  -- NVIM-LSPCONFIG {{{1
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = function()
      require('java').setup()

      require('_lsp')
    end,
    dependencies = {
      "folke/neoconf.nvim",
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {}
      },
      'hrsh7th/cmp-nvim-lsp'
    }
  },
  -- }}}

  -- NVIM-NIO {{{1
  'nvim-neotest/nvim-nio',
  -- }}}

  -- NVIM-TREESITTER {{{1
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      local treesitter_configs = require('nvim-treesitter.configs')
      local treesitter_install = require('nvim-treesitter.install')

      treesitter_configs.setup {
        sync_install = false,
        auto_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        }
      }

      treesitter_install.compilers = ({
        Linux = { 'gcc' },
        Windows_NT = { 'clang' }
      })[os]
    end
  },
  -- }}}

  -- OIL {{{1
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    opts = {
      default_file_explorer = true,
      columns = {
        'icon'
      },
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },
      }
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  -- }}}

  -- PATHLIB {{{1
  'pysan3/pathlib.nvim',
  -- }}}

  -- PLANTUML {{{1
  {
    'https://gitlab.com/itaranto/plantuml.nvim',
    ft = 'uml',
    opts = {
      renderer = {
        type = 'image',
        options = {
          prog = 'feh',
          dark_mode = true
        }
      }
    }
  },
  -- }}}

  -- PLENARY {{{1
  'nvim-lua/plenary.nvim',
  -- }}}

  -- REACH {{{1
  {
    'toppair/reach.nvim',
    lazy = false,
    config = function()
      local reach = require('reach')

      reach.setup {
        notifications = false
      }


      vim.keymap.set('n', '<leader>w', function()
        reach.buffers {
          auto_handles = vim.split('jfkdlshgurnciemxow,ypq.<', '')
        }
      end)
    end
  },
  -- }}}

  -- REST {{{1
  'rest-nvim/rest.nvim',
  -- }}}

  -- TELESCOPE {{{1
  {
    'nvim-telescope/telescope.nvim',
    keys = { '<leader><leader>' },
    config = function()
      local telescope = require('telescope')
      local telescope_builtin = require('telescope.builtin')

      telescope.setup()

      vim.keymap.set('n', '<leader><leader>f', telescope_builtin.find_files)
      vim.keymap.set('n', '<leader><leader>l', telescope_builtin.live_grep)
      vim.keymap.set('n', '<leader><leader>o', telescope_builtin.buffers)
      vim.keymap.set('n', '<leader><leader>w', "<Cmd>Telescope workspaces<CR>")
      vim.keymap.set('n', '<leader><leader>a', "<Cmd>Telescope aerial<CR>")
    end
  },
  -- }}}

  -- VIM-FLOATERM {{{1
  'voldikss/vim-floaterm',
  -- }}}

  -- VIM-PIO {{{1
  'normen/vim-pio',
  -- }}}

  -- VIMTEX {{{1
  {
    'lervag/vimtex',
    ft = { 'tex', 'ltx' }
  },
  -- }}}

  -- VIRTUAL-TYPES ??? {{{1
  -- 'jubnzv/virtual-types.nvim',
  -- }}}

  -- WORKSPACE {{{1
  {
    'natecraddock/workspaces.nvim',
    -- lazy = false,
    event = 'VeryLazy',
    config = function()
      local telescope = require('telescope')
      local workspaces = require('workspaces')

      workspaces.setup {
        sort = true,
        mru_sort = true,
        auto_open = true,
        hooks = {
          open = { "SessionManager load_current_dir_session" }
        }
      }

      telescope.load_extension('workspaces')
    end,
    dependencies = {
      'nvim-telescope/telescope.nvim'
    }
  }
  -- }}}

}, {
  defaults = { lazy = true }
})
