local M = {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}

function M.config()
  local status, comment = pcall(require, "Comment")
  if not status then
    return
  end

  comment.setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    toggler = {
      ---Line-comment keymap
      line = "<leader>-",
      ---Block-comment keymap
      block = "<leader>b",
    },
    opleader = {
      ---Line-comment keymap
      line = "<leader>-",
      ---Block-comment keymap
      block = "<leader>b",
    },
  })
end

return M
