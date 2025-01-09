local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define snippets
local snippets = {
  s('dbexecute', {
    t 'db.session.execute(text("',
    i(1, 'SQL'),
    t '"), {})',
  }),
}
-- print 'Flask snippets loaded - flask.lua'
-- Return snippets for LuaSnip
return snippets
