return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'python', 'bash', 'c', 'html', 'lua', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      playground = {
        enable = true,
        updatetime = 25, -- Debounced time for highlighting nodes
        persist_queries = false, -- Disable persistent queries across sessions
      },
    },
  },
  { -- Treesitter Playground extension
    'nvim-treesitter/playground',
  },
}
