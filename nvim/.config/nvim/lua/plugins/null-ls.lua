return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        ensure_installed = {
          "prettier",
          "stylua",
          "eslint_d",
        },
        automatic_installation = true,
        handlers = {},
      },
    },
  },
  config = function()
    local null_ls = require("null-ls")
    
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
      },
    })
  end,
} 