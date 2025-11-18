-- TypeScript/JavaScript specific settings
return {
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact" },
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        enable_progress_notifications = true,
        hide_progress_notifications_from_history = true,
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        pretty_errors = true,
      })
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("twoslash-queries").setup({
        multi_line = true,
        is_enabled = true,
        highlight = "Comment",
      })
    end,
  },
  {
    "David-Kunz/cmp-npm",
    ft = "json",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("cmp-npm").setup({})
    end,
  },
}