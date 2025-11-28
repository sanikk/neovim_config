return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,

      handlers = {},

      ensure_installed = {
        -- ADDED: debuggers you actually want
        'debugpy',     -- Python
        'codelldb',    -- C++
        -- netcoredbg is NOT installed by mason: you install it manually
      },
    }

    -- Dap UI setup
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    --------------------------------------------------------------------------
    -- REMOVED: Golang config
    -- require('dap-go').setup {...}
    --------------------------------------------------------------------------

    --------------------------------------------------------------------------
    -- ADDED: Python debugging (debugpy)
    --------------------------------------------------------------------------
    dap.adapters.python = {
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' },
    }

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        console = 'integratedTerminal',
      },
    }

    --------------------------------------------------------------------------
    -- ADDED: C++ debugging (codelldb)
    -- mason installs codelldb for you
    --------------------------------------------------------------------------
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch C++ executable",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    -- Also use C++ config for C files
    dap.configurations.c = dap.configurations.cpp

    --------------------------------------------------------------------------
    -- ADDED: C#/Unity debugging (netcoredbg)
    --------------------------------------------------------------------------
    dap.adapters.coreclr = {
      type = 'executable',
      command = 'netcoredbg',  -- you install netcoredbg manually
      args = { '--interpreter=vscode' },
    }

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'Launch Unity Debug',
        request = 'launch',
        program = function()
          return vim.fn.input(
            "Path to Unity DLL or EXE: ",
            vim.fn.getcwd() .. "/bin/Debug/",
            "file"
          )
        end,
      },
    }

  end,
}

