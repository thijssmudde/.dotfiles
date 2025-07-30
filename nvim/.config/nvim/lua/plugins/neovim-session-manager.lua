return {
  "Shatur/neovim-session-manager",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local session_manager = require("session_manager")
    
    session_manager.setup({
      -- Your configuration options here
    })
  end,
}
