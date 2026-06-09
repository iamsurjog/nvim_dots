-- ~/.config/nvim/lua/plugins/test.lua
return {
  "iamsurjog/langgraph.nvim", -- A placeholder name for lazy's UI
  config = function()
    require("langGraphVisualizer").setup()
  end,
}
