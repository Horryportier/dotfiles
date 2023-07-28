local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "clangd", "rust-analyzer", "gopls", "gdscript"}

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

--lspconfig.rust_analyzer.setup {
--  capabilities = capabilities,
--  on_attach = on_attach,
--  cmd = {
--    "rustup", "run", "stable", "rust-analyzer",
--  }
--}
