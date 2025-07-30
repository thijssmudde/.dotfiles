return {
  "gerazov/vim-toggle-bool",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Map toggle-bool command to space-fb
    vim.keymap.set('n', '<leader>fb', ':ToggleBool<CR>', { silent = true, desc = "Flip boolean" })
  end,
} 