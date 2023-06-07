-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'folke/tokyonight.nvim'
        use { "catppuccin/nvim", as = "catppuccin" }
        use 'bignimbus/pop-punk.vim'
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'nvim-tree/nvim-web-devicons', opt = true }
        }
        use 'ap/vim-css-color'
        ---- lsp
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use 'williamboman/nvim-lsp-installer'
        ---- telescope
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-media-files.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/vim-vsnip-integ'
        -- git stuff
        use 'tveskag/nvim-blame-line'
        -- tag bar
        use 'preservim/tagbar'
        -- godot plugins
        use 'habamax/vim-godot'
        -- nvim-self-py
        use 'Horryportier/nvim-self-py'
        -- docs view
        use {
                "amrbashir/nvim-docs-view",
                opt = true,
                cmd = { "DocsViewToggle" },
                config = function()
                        require("docs-view").setup {
                                position = "bottom",
                                height = 5,
                                width = 60,
                        }
                end
        }
        -- hover
        use 'lewis6991/hover.nvim'
        -- error
        use 'kaputi/e-kaput.nvim'
        -- snippet
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
        -- auto-save
        use({
                "Pocco81/auto-save.nvim",
                config = function()
                        require("auto-save").setup {
                                -- your config goes here
                                -- or just leave it empty :)
                        }
                end,
        })
        -- yuck
        use 'elkowar/yuck.vim'
        -- copy
        use 'NLKNguyen/copy-cut-paste.vim'
end)
