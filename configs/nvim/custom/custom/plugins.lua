local function hello()
  return [[hello world]]
end

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
        {'edluffy/hologram.nvim',
        lazy = false,
        opts = {
            auto_display = true,
        }
    },
    {
            'tjdevries/ocaml.nvim',
            -- opts = {require("ocaml").update()},
        lazy = false,
    },
    {
        'edKotinsky/Arduino.nvim',
        lazy = false,
            default_fqbn = "arduino:avr:uno",

    opts = {
    clangd = require 'mason-core.path'.bin_prefix 'clangd',

    arduino = '/home/linuxbrew/.linuxbrew/bin/arduino-cli',

    --Data directory of arduino-cli
    -- arduino_config_dir = <arduino-cli/data/dir>,

    --Extra options to arduino-language-server
    -- extra_opts = { ... }
        },
    },
    {
  'ada0l/obsidian',
  lazy = false,
  keys = {
    {
      '<leader>ov',
      function()
        Obsidian.select_vault()
      end,
      desc = "Select Obsidian vault",
    },
    {
      '<leader>oo',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.cd_vault()
        end)
      end,
      desc = 'Open Obsidian directory',
    },
    {
      '<leader>ot',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.open_today()
        end)
      end,
      desc = 'Open today',
    },
    {
      '<leader>od',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Write shift in days: ' }, function(input_shift)
            local shift = tonumber(input_shift) * 60 * 60 * 24
            Obsidian.open_today(shift)
          end)
        end)
      end,
      desc = 'Open daily node with shift',
    },
    {
      '<leader>on',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Write name of new note: ' }, function(name)
            Obsidian.new_note(name)
          end)
        end)
      end,
      desc = 'New note',
    },
    {
      '<leader>oi',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.select_template('telescope')
        end)
      end,
      desc = 'Insert template',
    },
    {
      '<leader>os',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.search_note('telescope')
        end)
      end,
      desc = 'Search note',
    },
    {
      '<leader>ob',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.select_backlinks('telescope')
        end)
      end,
      desc = 'Select backlink',
    },
    {
      '<leader>og',
      function()
        Obsidian.get_current_vault(function()
          Obsidian.go_to()
        end)
      end,
      desc = 'Go to file under cursor',
    },
    {
      '<leader>or',
      function()
        Obsidian.get_current_vault(function()
          vim.ui.input({ prompt = 'Rename file to' }, function(name)
            Obsidian.rename(name)
          end)
        end)
      end,
      desc = 'Rename file with updating links',
    },
    {
      "gf",
      function()
        if Obsidian.found_wikilink_under_cursor() ~= nil then
          return "<cmd>lua Obsidian.get_current_vault(function() Obsidian.go_to() end)<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true
    }
  },
  opts = function()
    ---@param filename string
    ---@return string
    local transformator = function(filename)
      if filename ~= nil and filename ~= '' then
        return filename
      end
      return string.format('%d', os.time())
    end
    return {
      vaults = {
        {
          dir = '~/Documents/Knowledge/',
          templates = {
            dir = 'templates/',
            date = '%Y-%d-%m',
            time = '%Y-%d-%m',
          },
          note = {
            dir = '',
            transformator = transformator,
          },
        },
        {
          dir = '~/Documents/SyncObsidian/',
          daily = {
            dir = '01.daily/',
            format = '%Y-%m-%d',
          },
          templates = {
            dir = 'templates/',
            date = '%Y-%d-%m',
            time = '%Y-%d-%m',
          },
          note = {
            dir = 'notes/',
            transformator = transformator,
          },
        }
      }
    }
  end
},
}

return plugins
