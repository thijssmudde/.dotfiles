return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons"     -- optional
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      -- Lspsaga configuration
      ui = {
        code_action = "💡",
      },
      code_action = {
        num_shortcut = false,  -- Remove number shortcuts
        keys = {
          quit = "q",
          exec = "<CR>",
        },
        extend_gitsigns = false,  -- Disable gitsigns integration
        filter = function(code_action)
          if not code_action or not code_action.title then
            return false
          end
          
          local title = code_action.title:lower()
          
          -- Filter out disable rules actions
          if title:find("disable") then
            return false
          end
          
          -- Prioritize import and declaration actions
          if title:find("import") or title:find("declaration") or title:find("move to") then
            return true
          end
          
          return true
        end
      },
    })
  end,
} 