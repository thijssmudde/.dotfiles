local M = {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  local status, colorizer = pcall(require, "colorizer")
  if not status then
    return
  end

  colorizer.setup({
    "css",
    "javascript",
    "typescript",
    "html",
  })
end

return M
