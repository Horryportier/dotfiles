-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
        use 'wbthomason/packer.nvim'
        use 'folke/tokyonight.nvim'
        use { "catppuccin/nvim", as = "catppuccin" }
        use 'vim-airline/vim-airline'
        use 'ap/vim-css-color'
        -- lsp
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'williamboman/nvim-lsp-installer'
        -- telescope
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-media-files.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/nvim-treesitter-context'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        -- git stuff
        use 'tveskag/nvim-blame-line'
        -- godot plugins
        use 'habamax/vim-godot'
        -- nvim-self-py
        use 'Horryportier/nvim-self-py'
        --use '/home/horryportier/Documents/nvim-self-py.nvim'
        -- hover
        use 'lewis6991/hover.nvim'
        -- error
        use 'kaputi/e-kaput.nvim'
        -- snippets
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'
        -- auto fromat
        use 'vim-autoformat/vim-autoformat'
        -- rainbow
        use 'p00f/nvim-ts-rainbow'
        -- hologram image viewer
        use 'edluffy/hologram.nvim'
        -- harpoon
        use 'ThePrimeagen/harpoon'
        -- color picker
        use 'ziontee113/color-picker.nvim'
        -- vimbegood
        use 'ThePrimeagen/vim-be-good'
        -- arduino 
        use 'stevearc/vim-arduino'
        -- tinygo 
        use 'sago35/tinygo.vim'
end)
