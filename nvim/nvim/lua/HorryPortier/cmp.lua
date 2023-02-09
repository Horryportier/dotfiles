require("nvim-lsp-installer").setup {}
-- Setup nvim-cmp.
local cmp = require'cmp'

require'lspconfig'.tsserver.setup {}

cmp.setup({
        snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        --require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        --vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
        },
        window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                --{ name = 'ultisnips' }, -- For ultisnips users.
                --{ name = 'snippy' }, -- For snippy users.
        }, {
                { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
                { name = 'buffer' },
        })
})


cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
                { name = 'buffer' }
        }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
                { name = 'path' }
        }, {
                { name = 'cmdline' }
        })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['sumneko_lua'].setup {
        capabilities = capabilities,

        Lua = {
                diagnostics = {
                        globals = {'vim'}
                }
        }
}
require('lspconfig')['gopls'].setup {
        capabilities = capabilities,
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},
}


require('lspconfig')['pyright'].setup {
        capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
        capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
        capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
        capabilities = capabilities
}
require'lspconfig'.gdscript.setup{
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require('lspconfig')['dockerls'].setup {
        capabilities = capabilities
}
require('lspconfig')['emmet_ls'].setup {
        capabilities = capabilities
}

-- arduino sucks
local my_arduino_fqbn = {
    ["/home/horryportier/Documents/AI_glove/sketch/WebUpdater"] = "esp32:esp32",
    ["/home/h4ck3r/dev/arduino/sensor"] = "arduino:mbed:nanorp2040connect",
}

local DEFAULT_FQBN = "arduino:avr:uno"

require('lspconfig')['arduino_language_server'].setup {
    on_new_config = function (config, root_dir)
        local fqbn = my_arduino_fqbn[root_dir]
        if not fqbn then
            vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
            fqbn = DEFAULT_FQBN
        end
        config.cmd = {
            "arduino-language-server",
            "-cli-config", "/home/horryportier/.arduino/arduino-cli.yaml",
            "-fqbn",fqbn
        }
    end
}
