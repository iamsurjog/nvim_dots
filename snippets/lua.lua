-- Example: Defining a Lua snippet in a file like `~/.config/nvim/snippets/lua.lua`
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("hello", {
    t("print('Hello, World!')"),
  }),
  s("func", {
    t("function "),
    i(1, "function_name"),
    t("("),
    i(2, "args"),
    t(")\n\t"),
    i(0),
    t("\nend"),
  }),
}
