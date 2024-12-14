return {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- barbar for the tabs bar. at least for the tabs bar.
  {
    'romgrk/barbar.nvim',
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons', version = false },
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },
  -- { 'LazyVim/LazyVim', opts = { colorscheme = 'gruvbox' } },
  -- { 'folke/tokyonight.nvim',
  --  priority = 1000, -- Make sure to load this before all the other start plugins.
  --  init = function()
  -- Load the colorscheme here.
  -- Like many other themes, this one has different styles, and you could load
  -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --    vim.cmd.colorscheme 'tokyonight-night'

  -- You can configure highlights by doing something like:
  --  vim.cmd.hi 'Comment gui=none'
  --  end,
  --},
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'onedark'
      require('onedark').setup {
        style = 'deep',
      }
      require('onedark').load()
    end,
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
