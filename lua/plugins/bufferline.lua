return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        separator_style = 'thick',
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    }

    -- vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
    -- vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })
    --
    -- vim.keymap.set('n', '
    --     { '<leader>bd', '<cmd>bdelete<cr>',            desc = 'Close current buffer' },
    --     { '<leader>bh', '<cmd>BufferLineMovePrev<cr>', desc = 'Move current buffer left' },
    --     { '<leader>bl', '<cmd>BufferLineMoveNext<cr>', desc = 'Move current buffer right' },
  end,
}
