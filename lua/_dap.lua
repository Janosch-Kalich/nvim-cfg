local dap = require('dap')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

function codelldb(exec_name)
  dap.adapters.codelldb = {
    type = 'server',
    port = '10101',
    terminal = 'external',
    executable = {
      command = vim.fn.stdpath('data') .. '/mason/bin/' .. exec_name,
      args = { '--port', '10101' },
      detached = false,
    }
  }

  dap.configurations.c = {
    {
      name = 'Launch (codelldb)',
      type = 'codelldb',
      request = 'launch',
      program = function()
        return coroutine.create(function(coro)
          local opts = {}
          pickers
          .new(opts, {
            prompt_title = 'Path to executable',
            finder = finders.new_oneshot_job({ 'fd', '--hidden', '--no-ignore', '--type', 'x' }, {}),
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
      cwd = '${workspaceFolder}',
      stopOnEntry = false
    }
  }

  dap.configurations.cpp = dap.configurations.c
  dap.configurations.rust = dap.configurations.c
  dap.configurations.odin = dap.configurations.c
end

local dap_cfg = {
  Linux = function()
    codelldb('codelldb')
  end,
  Windows_NT = function()
    codelldb('codelldb.cmd')
  end
}

return dap_cfg
