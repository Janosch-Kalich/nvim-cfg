require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").ocamllsp.setup{on_attach=require'virtualtypes'.on_attach}
require("flutter-tools").setup {}
require("fidget").setup{}
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false
})
