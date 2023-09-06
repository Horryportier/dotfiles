local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = {"astro-language-server","ocaml-lsp", "html", "cssls", "clangd", "rust-analyzer", "gopls", "gdscript", "python-lsp-server", "arduino_language_server"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer",
  }
})

lspconfig.ocamllsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.astro.setup{
    cmd = {
        "astro-ls", "--stdio"
    }
}

-- lspconfig.ocamllsp.setup(  {
--     get_language_id = function(_, ftype)
--       return ftype
--     end
-- })
--
local arduino = require('arduino')

lspconfig.arduino_language_server.setup {
    on_new_config = arduino.on_new_config,
}

--lspconfig.rust_analyzer.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  cmd = {
--    "rustup", "run", "stable", "rust-analyzer",
--  }
--}
