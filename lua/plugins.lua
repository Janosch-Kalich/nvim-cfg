local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
  'pysan3/pathlib.nvim',
  'nvim-neorg/lua-utils.nvim',
  'nvim-neotest/nvim-nio',
  'vhyrro/luarocks.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'nvim-treesitter/nvim-treesitter',
  'EdenEast/nightfox.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  'Shatur/neovim-session-manager',
  'nvim-tree/nvim-tree.lua',
  'nvim-telescope/telescope.nvim',
  'mfussenegger/nvim-dap',
  'jay-babu/mason-nvim-dap.nvim',
  'rcarriga/nvim-dap-ui',
  'lewis6991/gitsigns.nvim',
  'nvim-tree/nvim-web-devicons',
  'romgrk/barbar.nvim',
  'voldikss/vim-floaterm',
  'natecraddock/workspaces.nvim',
  'jubnzv/virtual-types.nvim',
  'stevearc/aerial.nvim',
  'ldelossa/litee.nvim',
  'ldelossa/litee-bookmarks.nvim',
  'ldelossa/litee-symboltree.nvim',
  {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  },
  'akinsho/flutter-tools.nvim',
  'ray-x/web-tools.nvim',
  'yamatsum/nvim-cursorline',
  'smoka7/hop.nvim',
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim';
  {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  },
  'lervag/vimtex',
  'normen/vim-pio',
  'nacro90/numb.nvim',
  'toppair/reach.nvim',
  'frabjous/knap',
  {
    'jbyuki/nabla.nvim',
    config = function()
      require('nabla').enable_virt()
    end
  },
  {
    'nvim-neorg/neorg',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = vim.env.NOTES_DIR,
              }
            }
          },
        }
      }
    end,
    dependencies = 'nvim-lua/plenary.nvim'
  },
  'mfussenegger/nvim-jdtls',
  {
    'aserowy/tmux.nvim',
    config = function () return require('tmux').setup() end,
    cond = function () return vim.loop.os_uname().sysname == 'Linux' end
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'mhartington/formatter.nvim',
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    config = function()
      local ht = require('haskell-tools')
    end
  },
  'fedorenchik/fasm.vim',
  {
    'RaafatTurki/hex.nvim',
    config = function () return require('hex').setup() end
  },
  {
    'https://gitlab.com/itaranto/plantuml.nvim',
    version = '*',
    config = function() require('plantuml').setup {
        renderer = {
          type = 'image',
          options = {
            prog = 'feh',
            dark_mode = true,
          }
        },
    } end,
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/nvim-java-refactor',
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          }
        }
      }
    }
  }
})
