-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically set foldmethod to 'manual' when entering Visual mode
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = 'v*', -- Trigger on any visual mode (line-wise, block-wise, etc.)
  callback = function()
    vim.o.foldmethod = 'manual'
  end,
})

-- Automatically set foldmethod back to 'syntax' when leaving Visual or Insert mode
vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
  pattern = '!v*', -- Trigger on leaving Insert or Visual mode
  callback = function()
    vim.o.foldmethod = 'syntax'
  end,
})

-- Autoformatter on save, for non-python files
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    if vim.bo.filetype ~= 'python' then
      vim.lsp.buf.format { async = false }
    end
  end,
})

-- Autoformatter for Python files using Conform
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.py',
  callback = function()
    require('conform').format { async = false }
  end,
})

-- Switch to normal mode when changing focus to neo-tree window
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'neo-tree://*',
  callback = function()
    if vim.fn.mode() ~= 'n' then
      vim.cmd 'stopinsert'
    end
  end,
})
-- Manual Commands

-- Command to load C++ Qt snippets
vim.api.nvim_create_user_command('LoadCppQtSnippets', function()
  require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/snippets/cpp-qt.lua' } }
  print 'C++ Qt snippets loaded!'
end, { desc = 'Load C++ Qt snippets' })

-- color border between neotree and code according to mode
-- local function update_neotree_border_color()
--   local mode = vim.fn.mode()
--   local mode_colors = {
--     n = '#3b82f6', -- Blue for Normal
--     i = '#16a34a', -- Green for Insert
--     v = '#7c3aed', -- Purple for Visual
--     R = '#dc2626', -- Red for Replace
--   }
--   local color = mode_colors[mode] or '#ffffff'
--   vim.api.nvim_set_hl(0, 'NeoTreeBorder', { fg = color })
-- end
--
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   callback = update_neotree_border_color,
-- })
