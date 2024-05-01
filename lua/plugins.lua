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
  'rest-nvim/rest.nvim',
  'ray-x/web-tools.nvim',
  'yamatsum/nvim-cursorline',
  'smoka7/hop.nvim',
  'Maan2003/lsp_lines.nvim',
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
          }
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
  --[[{
    'mrcjkb/haskell-tools.nvim',
    version = '^3', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  }]]--
  'fedorenchik/fasm.vim'
})
