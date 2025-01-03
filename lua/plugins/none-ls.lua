return {
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require 'null-ls'
            local sources = {
                -- Your desired tools
                null_ls.builtins.diagnostics.clazy,
                -- null_ls.builtins.formatting.djlint,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.diagnostics.cppcheck,

                -- Python
                null_ls.builtins.diagnostics.flake8,
                null_ls.builtins.formatting.black,

                -- SQL
                null_ls.builtins.formatting.sql_formatter,

                -- CSS
                null_ls.builtins.diagnostics.stylelint,
                null_ls.builtins.formatting.stylelint,

                -- Lua
                null_ls.builtins.formatting.stylua,
            }

            null_ls.setup {
                sources = sources,
            }
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    },
}
