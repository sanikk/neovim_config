return {

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>b', group = '[B]uffers' },
        { '<leader>l', group = '[L]azyGit' },
        { '<leader>p', group = '[P]roject' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },

      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      {
        '<leader>lh',
        function()
          -- Your custom function here
        end,
        desc = 'LazyGit Custom Function',
      },

      { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Close current buffer' },
      { '<leader>bh', '<cmd>BufferLineMovePrev<cr>', desc = 'Move current buffer left' },
      { '<leader>bl', '<cmd>BufferLineMoveNext<cr>', desc = 'Move current buffer right' },

      { '<leader>s', '<nop>', desc = 'Search' },

      { '<leader>d', '<nop>', desc = 'Debug' },

      { '<leader>t', '<nop>', desc = 'Toggle' },

      { '<leader>pt', '<cmd>TodoQuickFix<cr>', desc = 'List project TODOs' },
      -- { '<leader>pk',
    },
  },
}
