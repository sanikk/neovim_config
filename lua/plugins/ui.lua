return {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    -- barbar for the tabs bar. at least for the tabs bar.
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('bufferline').setup {
                options = {
                    numbers = 'ordinal',
                    mappings = true,
                    close_command = 'bdelete! %d',
                    right_mouse_command = 'bdelete! %d',
                    left_mouse_command = 'buffer %d',
                    middle_mouse_command = nil,
                    diagnostics = 'nvim_lsp',
                    --- count is an integer representing total count of errors
                    --- level is a string "error" | "warning"
                    --- this should return a string
                    --- Don't get too fancy as this function will be executed a lot
                    diagnostics_indicator = function(count, level)
                        local icon = level:match 'error' and ' ' or ''
                        return ' ' .. icon .. count
                    end,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    show_tab_indicators = true,
                    separator_style = 'thick',
                    always_show_bufferline = true,
                },
            }
        end,
    },

    -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },
    -- { 'LazyVim/LazyVim', opts = { colorscheme = 'gruvbox' } },
    --  {
    --    'folke/tokyonight.nvim',
    --    priority = 1000, -- Make sure to load this before all the other start plugins.
    --    init = function()
    --      -- Load the colorscheme here.
    --      -- Like many other themes, this one has different styles, and you could load
    --      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --      vim.cmd.colorscheme 'tokyonight-night'

    --      -- You can configure highlights by doing something like:
    --      --  vim.cmd.hi 'Comment gui=none'
    --    end,
    --    --},
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'onedark'
            require('onedark').setup {
                dim_inactive = false,
                style = 'deep',
                colors = {
                    deeppurple = '#913386',
                    white = '#efeff0',
                    wellofyellow = '#c4ac41',
                },
                highlights = {
                    -- Comment = { fg = '$white' },
                    -- TabLineFill = { fg = '$deeppurple' },
                    --           -- For TreeSitter comments
                    --           -- For LSP test
                    -- treesitter = {
                    --     TSComment = { fg = '$deeppurple' },
                    -- },
                },
            }
            require('onedark').load()
        end,
    },
    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
