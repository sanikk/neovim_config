return {

  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      --       {
      --         '<leader>lh',
      --         function()
      --           -- Function logic encapsulated here
      --           --           local function lazygit_with_commit_msg()
      --           --             -- Open a horizontal split for Lazygit
      --           --             vim.cmd 'vsplit'
      --           --             -- Open Lazygit in the new split
      --           --             vim.cmd 'term lazygit'
      --           --             -- Navigate to the other split
      --           --             vim.cmd 'wincmd h' -- Adjust to navigate up or down as needed
      --           --             -- Open the commit message file
      --           --             vim.cmd 'edit .git/COMMIT_EDITMSG'
      --           --           end
      --           local function open_commit_message_in_magic_workspace()
      --             -- Path to the commit message file
      --             local cwd = vim.fn.system('pwd'):gsub('\n', '') -- Capture the output of pwd and remove trailing newline
      --
      --             -- Full path to the commit message file
      --             local commit_message_file = cwd .. '/.git/COMMIT_EDITMSG'
      --             -- local commit_message_file = '.git/COMMIT_EDITMSG'
      --
      --             -- Hyprctl command to open Neovim with the commit message file in the magic workspace
      --             local cmd = string.format(
      --               'hyprctl dispatch exec "kitty --class=specialMagicTerm nvim %s"; sleep 0.2; hyprctl dispatch movetoworkspace special:magic,class:specialMagicTerm',
      --               commit_message_file
      --             )
      --
      --             -- Execute the command
      --             os.execute(cmd)
      --           end
      --           -- Call the function
      --           -- lazygit_with_commit_msg()
      --           open_commit_message_in_magic_workspace()
      --         end,
      --         desc = 'Open Lazygit with commit message split',
      --       },
    },
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
