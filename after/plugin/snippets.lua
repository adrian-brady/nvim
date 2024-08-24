local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local types = require 'luasnip.util.types'

ls.add_snippets('all', {
  s('expand', t 'expanded'),
})
