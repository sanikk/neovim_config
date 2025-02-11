return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        -- Your which-key options here
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show { global = false }
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },

        { '<leader>l',  desc = 'LazyGit' },
        { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
        {
            '<leader>lh',
            function()
                -- Your custom function here
            end,
            desc = 'LazyGit Custom Function',
        },
        { '<leader>b',  desc = 'Buffers' },
        { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Close current buffer' },
    },
    config = function(_, opts)
        require('which-key').setup(opts)
        -- Additional setup if needed
    end,
}
