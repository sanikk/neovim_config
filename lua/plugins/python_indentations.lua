return {
  {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },

  --   {
  --     'lukas-reineke/indent-blankline.nvim',
  --     main = 'ibl',
  --     ---@module "ibl"
  --     ---@type ibl.config
  --     opts = {},
  --   },
}
