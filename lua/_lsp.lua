require("mason").setup()
require('java').setup()
require("mason-lspconfig").setup()
require("flutter-tools").setup {}
require("fidget").setup{}

vim.diagnostic.config({
  virtual_text = false
})
