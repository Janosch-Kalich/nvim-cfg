require("mason").setup()
require('java').setup()
require("mason-lspconfig").setup()
require("flutter-tools").setup {}
require("fidget").setup{}
require("lsp_lines").setup()

vim.diagnostic.config({
  virtual_text = false
})
