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

        { '<leader>l',  '<nop>',            desc = 'LazyGit' },
        { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
        {
            '<leader>lh',
            function()
                -- Your custom function here
            end,
            desc = 'LazyGit Custom Function',
        },

        { '<leader>b',  '<nop>',                       desc = 'Buffers' },
        { '<leader>bd', '<cmd>bdelete<cr>',            desc = 'Close current buffer' },
        { '<leader>bh', '<cmd>BufferLineMovePrev<cr>', desc = 'Move current buffer left' },
        { '<leader>bl', '<cmd>BufferLineMoveNext<cr>', desc = 'Move current buffer right' },

        { '<leader>s',  '<nop>',                       desc = 'Search' },

        { '<leader>d',  '<nop>',                       desc = 'Debug' },

        { '<leader>t',  '<nop>',                       desc = 'Toggle' },

        { '<leader>p',  '<nop>',                       desc = 'Project' },
        { '<leader>pt', '<cmd>TodoQuickFix<cr>',       desc = 'List project TODOs' },
        -- { '<leader>pk',
    },
    config = function(_, opts)
        require('which-key').setup(opts)
        -- Additional setup if needed
    end,
}
