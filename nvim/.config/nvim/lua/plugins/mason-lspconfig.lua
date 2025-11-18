return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "eslint",
      "lua_ls",
      "jsonls",
      "html",
      "cssls",
      "tailwindcss",
      "prismals",
      "graphql",
      -- typescript handled by typescript-tools.nvim
    },
    automatic_installation = true,
  },
} 