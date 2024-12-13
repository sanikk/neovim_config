local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('cpp', {
  s('hw', {
    t {
      '#include <iostream>',
      'int main() {',
      '    std::cout << "Hello, World!" << std::endl;',
      '    return 0;',
      '}',
    },
  }),
  s('main', {
    t {
      'int main(int argc, char* argv[]) {',
      '',
      '}',
    },
  }),
})
