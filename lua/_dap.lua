require('mason').setup()
require('mason-nvim-dap').setup({
  ensure_installed = { 'codelldb' },
  automatic_setup = true,
  handlers = {}
})
require('dapui').setup()

local dap = require('dap')
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
--[[
dap.adapters.lldb = {
  type = 'executable',
  command = 'C:\\Program Files\\LLVM\\bin\\lldb-vscode.exe',
  env = {
    LLDB_DEBUGSERVER_PATH = "C:\\Program Files\\LLVM\\bin\\lldb-server.exe"
  },
  name = 'lldb'
}]]--

if vim.loop.os_uname().sysname == "Windows_NT" then
  dap.adapters.codelldb = {
    type = "server",
    port = "10101",
    terminal = "external",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb.cmd",
      args = { "--port", "10101" },
      detached = false,
    }
  }
else
  dap.adapters.codelldb = {
    type = "server",
    port = "10101",
    terminal = "external",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      args = { "--port", "10101" },
      detached = false,
    }
  }

  dap.adapters.haskell = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/haskell-debug-adapter",
  }
end

dap.configurations.cpp = {
  --[[{
    name = 'Launch (lldb)',
    type = 'lldb',
    request = 'launch',
    program = function()
      return coroutine.create(function(coro)
        local opts = {}
        pickers
        .new(opts, {
          prompt_title = "Path to executable",
          finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
          sorter = conf.generic_sorter(opts),
          attach_mappings = function(buffer_number)
            actions.select_default:replace(function()
              actions.close(buffer_number)
              coroutine.resume(coro, action_state.get_selected_entry()[1])
            end)
            return true
          end,
        })
        :find()
      end)
    end,
    cwd = '${workspaceFolder}/debug'
  },]]--
  {
    name = 'Launch (codelldb)',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return coroutine.create(function(coro)
        local opts = {}
        pickers
        .new(opts, {
          prompt_title = "Path to executable",
          finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
          sorter = conf.generic_sorter(opts),
          attach_mappings = function(buffer_number)
            actions.select_default:replace(function()
              actions.close(buffer_number)
              coroutine.resume(coro, action_state.get_selected_entry()[1])
            end)
            return true
          end,
        })
        :find()
      end)
    end,
    cwd = '${workspaceFolder}/debug',
    stopOnEntry = false
  }
}

dap.configurations.rust = dap.configurations.cpp
dap.configurations.c = dap.configurations.cpp

dap.configurations.haskell = {
  {
    name = 'Launch (haskell-debug-adapter)',
    type = 'haskell',
    request = 'launch',
    startup = '${file}',
    workspace = '${workspaceFolder}',
    stopOnEntry = true,
    logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
    logLevel = 'WARNING',
    ghciEnv = vim.empty_dict(),
    ghciPrompt = "λ: ",
    ghciInitialPrompt = "λ: ",
    ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
  }
}
