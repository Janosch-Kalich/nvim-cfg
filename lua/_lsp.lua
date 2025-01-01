local cmp_nvim_lsp = require('cmp_nvim_lsp')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

local vue_typescript_plugin = require('mason-registry')
  .get_package('vue-language-server')
  :get_install_path()
  .. '/node_modules/@vue/language-server'
  .. '/node_modules/@vue/typescript-plugin'

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
  end,
  ['volar'] = function()
    lspconfig.volar.setup {
      init_options = {
        typescript = {
          tsdk = os.getenv('TSDK')
        }
      }
    }
  end,
  ['ts_ls'] = function()
    lspconfig.ts_ls.setup ({
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_typescript_plugin,
            languages = {'javascript', 'typescript', 'vue'},
          },
        },
      },
      filetypes = {
        'javascript', 'typescript', 'vue'
      }
    })
  end,
}
