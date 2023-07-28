local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "gopls",
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "glow",
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "pocco81/auto-save.nvim",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
    {
        "folke/neodev.nvim", lazy = false, opts = {}
    },
  {
    'habamax/vim-godot',
    lazy = false,
  },
}

return plugins
