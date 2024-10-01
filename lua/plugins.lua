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

require('lazy').setup {
  -- !!!
  'stevearc/aerial.nvim',
  --
  'goolord/alpha-nvim',
  'romgrk/barbar.nvim',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  {
    'stevearc/dressing.nvim',
    opts = {}
  },
  'fedorenchik/fasm.vim',
  'j-hui/fidget.nvim',
  'akinsho/flutter-tools.nvim',
  -- !!!
  'lewis6991/gitsigns.nvim',
  --
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
  },
  'RaafatTurki/hex.nvim',
  'smoka7/hop.nvim',
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {}
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/nvim-java-refactor',
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'nvim-java/nvim-java-refactor',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry'
          }
        }
      }
    }
  },
  'frabjous/knap',
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  'nvim-neorg/lua-utils.nvim',
  'nvim-lualine/lualine.nvim',
  'vhyrro/luarocks.nvim',
  'L3MON4D3/LuaSnip',
  {
    'iamcco/markdown-preview.nvim',
    run = vim.fn['mkdp#util#install']
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jay-babu/mason-nvim-dap.nvim',
  'jbyuki/nabla.nvim',
  'nvim-neorg/neorg',
  'Shatur/neovim-session-manager',
  'nacro90/numb.nvim',
  'EdenEast/nightfox.nvim',
  'hrsh7th/nvim-cmp',
  'yamatsum/nvim-cursorline',
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'neovim/nvim-lspconfig',
  'nvim-neotest/nvim-nio',
  'nvim-treesitter/nvim-treesitter',
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  'pysan3/pathlib.nvim',
  'https://gitlab.com/itaranto/plantuml.nvim',
  'nvim-lua/plenary.nvim',
  'toppair/reach.nvim',
  'rest-nvim/rest.nvim',
  'nvim-telescope/telescope.nvim',
  'voldikss/vim-floaterm',
  'normen/vim-pio',
  'lervag/vimtex',
  -- ???
  -- 'jubnzv/virtual-types.nvim',
  --
  'natecraddock/workspaces.nvim'
}
