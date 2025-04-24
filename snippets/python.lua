local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt
local events = require 'luasnip.util.events'

-- Utility function to get function arguments from the line above
local function get_args_from_function_line(args_string)
    local args = {}

    -- Remove self parameter for class methods
    args_string = args_string:gsub('^self,?%s*', '')

    -- Split the arguments string by commas
    for arg in string.gmatch(args_string, '([^,]+)') do
        -- Trim whitespace
        arg = arg:match '^%s*(.-)%s*$'

        -- Extract parameter name (remove default values, type hints)
        local param_name = arg:match '^([%a_][%w_]*)%s*:?.*$'

        if param_name and param_name ~= '' and param_name ~= 'self' then
            table.insert(args, param_name)
        end
    end

    return args
end

-- Function to create snippets for function arguments
local function function_args_snippet(position)
    return d(position, function(args)
        local nodes = {}
        local arg_string = args[1][1]
        local args_list = get_args_from_function_line(arg_string)

        if #args_list == 0 then
            return sn(nil, { t '' })
        end

        for i, arg in ipairs(args_list) do
            table.insert(nodes, t('    ' .. arg .. ' ('))
            table.insert(nodes, i(i, 'type'))
            table.insert(nodes, t '): ')
            table.insert(nodes, i(i + #args_list, 'description'))

            if i < #args_list then
                table.insert(nodes, t { '', '' })
            end
        end

        return sn(nil, nodes)
    end, { 1 })
end

local snippets = {
    -- Function docstring
    s(
        'fndoc',
        fmt(
            [[
    def {}({}):
        """{}

        {}

        Args:
{}

        Returns:
            {}: {}

        Raises:
            {}: {}
        """
        {}
    ]],
            {
                i(1, 'function_name'),
                i(2, 'args'),
                i(3, 'Function description'),
                i(4, 'Extended description'),
                function_args_snippet(5),
                i(6, 'return_type'),
                i(7, 'return_description'),
                i(8, 'Exception'),
                i(9, 'exception_description'),
                i(10, 'pass'),
            }
        )
    ),

    -- Class docstring
    s(
        'cldoc',
        fmt(
            [[
    class {}({}):
        """{}

        {}

        Attributes:
            {} ({}): {}

        Args:
{}

        Raises:
            {}: {}
        """

        def __init__(self, {}):
            {}
    ]],
            {
                i(1, 'ClassName'),
                i(2, 'object'),
                i(3, 'Class description'),
                i(4, 'Extended description'),
                i(5, 'attribute_name'),
                i(6, 'type'),
                i(7, 'description'),
                function_args_snippet(8),
                i(9, 'Exception'),
                i(10, 'exception_description'),
                rep(2),
                i(11, 'pass'),
            }
        )
    ),

    -- Simple docstring
    s(
        'doc',
        fmt(
            [[
    """{}

    {}
    """
    ]],
            {
                i(1, 'Short description'),
                i(2, 'Extended description'),
            }
        )
    ),

    -- Main function
    s(
        'main',
        fmt(
            [[
    def main():
        {}


    if __name__ == "__main__":
        main()
    ]],
            {
                i(1, 'pass'),
            }
        )
    ),

    -- List comprehension
    s(
        'lc',
        fmt('[{} for {} in {}{}]', {
            i(1, 'expression'),
            i(2, 'item'),
            i(3, 'iterable'),
            c(4, {
                t '',
                fmt(' if {}', { i(1, 'condition') }),
            }),
        })
    ),

    -- Dictionary comprehension
    s(
        'dc',
        fmt('{{{}: {} for {} in {}{}}}', {
            i(1, 'key'),
            i(2, 'value'),
            i(3, 'item'),
            i(4, 'iterable'),
            c(5, {
                t '',
                fmt(' if {}', { i(1, 'condition') }),
            }),
        })
    ),

    -- Try/except block
    s(
        'try',
        fmt(
            [[
    try:
        {}
    except {}:
        {}
    {}
    ]],
            {
                i(1, 'pass'),
                i(2, 'Exception'),
                i(3, 'pass'),
                c(4, {
                    t '',
                    fmt(
                        [[
    finally:
        {}]],
                        { i(1, 'pass') }
                    ),
                }),
            }
        )
    ),

    -- Context manager
    s(
        'with',
        fmt(
            [[
    with {} as {}:
        {}
    ]],
            {
                i(1, 'expression'),
                i(2, 'variable'),
                i(3, 'pass'),
            }
        )
    ),

    -- Assert with message
    s(
        'asm',
        fmt('assert {}, "{}"', {
            i(1, 'condition'),
            i(2, 'message'),
        })
    ),
}

return snippets
