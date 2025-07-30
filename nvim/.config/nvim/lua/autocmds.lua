-- Auto-close quickfix window when selecting an entry
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- In quickfix window, Enter opens the entry and closes quickfix
    vim.keymap.set("n", "<CR>", function()
      local line_nr = vim.api.nvim_win_get_cursor(0)[1]
      vim.cmd("cc " .. line_nr)  -- Jump to the quickfix entry
      vim.cmd("cclose")          -- Close the quickfix window
    end, { buffer = true, desc = "Open reference and close quickfix window" })
  end,
})