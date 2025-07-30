return {
  "projekt0n/github-nvim-theme",
  lazy = true,
  priority = 1000,
  config = function()
    require("github-theme").setup({
      options = {
        darken = {
          floats = true,
          sidebars = {
            enable = true,
            list = { "qf", "vista_kind", "terminal", "packer" },
          },
        },
        transparent = false,
        dim_inactive = true,
        theme_style = "github_dark_high_contrast",
      },
      groups = {
        all = {
          htmlTag = { fg = "#e06c75", bg = "#282c34", sp = "#00ff00", style = "underline" },
          DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
          TSField = {},
          -- Darker background colors
          Normal = { bg = "#0d1117" }, -- GitHub's darkest background
          NormalFloat = { bg = "#161b22" },
          SignColumn = { bg = "#0d1117" },
          StatusLine = { bg = "#161b22" },
        },
      },
    })
    -- vim.cmd("colorscheme github_dark_high_contrast")
  end,
} 