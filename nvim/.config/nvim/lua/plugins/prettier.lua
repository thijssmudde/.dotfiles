return {
  "MunifTanjim/prettier.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    bin = "prettier", -- or `'prettierd'` (v0.22+)
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  },
}
