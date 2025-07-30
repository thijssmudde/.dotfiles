return {
  "micmine/jumpwire.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("plugins.jumpwire")
  end,
}
