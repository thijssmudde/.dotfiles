return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    options = vim.opt.sessionoptions:get(),
    pre_save = nil,
    save_empty = false,
  },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("persistence_init", { clear = true }),
      callback = function()
        if vim.fn.argc() == 0 then
          pcall(require("persistence").load)
        end
      end,
      nested = true,
    })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("persistence_exit", { clear = true }),
      callback = function()
        require("persistence").save()
      end,
    })
  end,
} 