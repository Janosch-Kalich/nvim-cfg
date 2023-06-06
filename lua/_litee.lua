require('litee.lib').setup({})
require('litee.bookmarks').setup({})
require('litee.symboltree').setup({})

--![[vim.lsp.handlers['textDocument/documentSymbol'] = vim.lsp.with(
--![[            require('litee.lsp.handlers').ws_lsp_handler(), {}
--![)--]
