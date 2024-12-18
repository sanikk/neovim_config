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

-- Command to load C++ Qt snippets
vim.api.nvim_create_user_command('LoadCppQtSnippets', function()
  require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/snippets/cpp-qt.lua' } }
  print 'C++ Qt snippets loaded!'
end, { desc = 'Load C++ Qt snippets' })

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
