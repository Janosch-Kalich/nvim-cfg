require('packer').startup(function(use)
  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use 'wbthomason/packer.nvim';
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'nvim-treesitter/nvim-treesitter'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'Shatur/neovim-session-manager'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use {
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
    'rcarriga/nvim-dap-ui'
  }
  use {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
    'romgrk/barbar.nvim'
  }
  use 'wfxr/minimap.vim'
  use 'voldikss/vim-floaterm'
  use 'natecraddock/workspaces.nvim'
  use 'jubnzv/virtual-types.nvim'
  use 'stevearc/aerial.nvim'
  use 'ldelossa/litee.nvim'
  use 'ldelossa/litee-bookmarks.nvim'
  use 'ldelossa/litee-symboltree.nvim'
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  }
  use 'akinsho/flutter-tools.nvim'
  use 'rest-nvim/rest.nvim'
  use 'ray-x/web-tools.nvim'
  use 'yamatsum/nvim-cursorline'
  use 'phaazon/hop.nvim'
  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    as = "lsp_lines",
  }
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'lervag/vimtex'
  use 'normen/vim-pio'
  use 'nacro90/numb.nvim'
  use 'toppair/reach.nvim'
  use 'frabjous/knap'
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    }
    end,
    requires = "nvim-lua/plenary.nvim",
  }
  use 'mfussenegger/nvim-jdtls'
  if vim.loop.os_uname().sysname == 'Linux' then
    use {
      'aserowy/tmux.nvim',
      config = function () return require('tmux').setup() end
    }
  end
end)
