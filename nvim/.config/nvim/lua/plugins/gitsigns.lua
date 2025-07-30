local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local status, gitsigns = pcall(require, "gitsigns")
  if not status then
    return
  end

  -- configure/enable gitsigns
  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  })
end

return M
