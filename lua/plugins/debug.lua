return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui', -- Optional UI
      'williamboman/mason.nvim', -- For managing debuggers
    },
    config = function()
      require('dapui').setup()
      local dap = require 'dap'
      -- Configure lldb adapter for C++ debugging
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-dap', -- Adjust path if needed
        name = 'lldb',
      }
      dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'lldb', -- Matches the adapter name
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },
}
