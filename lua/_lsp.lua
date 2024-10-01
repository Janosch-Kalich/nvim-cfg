local cmp_nvim_lsp = require('cmp_nvim_lsp')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = lsp_capabilities,
    }
  end,
  ['clangd'] = function()
    lspconfig.clangd.setup {
      filetypes = {
        'c', 'cpp', 'objc', 'objcpp', 'cuda'
      }
    }
  end,
  ['ltex'] = function()
    lspconfig.ltex.setup {
      filetypes = {
        'ltx', 'tex', 'md'
      }
    }
  end
  --[[
  ['tsserver'] = function()
    lspconfig.tsserver.setup ({
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = config.typescript_plugin,
            languages = {'javascript', 'typescript', 'vue'},
          },
        },
      },
      filetypes = {
        'javascript', 'typescript', 'vue'
      }
    })
  end,
  --]]
}
