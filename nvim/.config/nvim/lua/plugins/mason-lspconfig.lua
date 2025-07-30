return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "eslint",
      "lua_ls",
      -- typescript handled by typescript-tools.nvim
    },
    automatic_installation = true,
  },
} 