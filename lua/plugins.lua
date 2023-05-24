---@diagnostic disable: 1011
return require('packer').startup(function(use)
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
end)
