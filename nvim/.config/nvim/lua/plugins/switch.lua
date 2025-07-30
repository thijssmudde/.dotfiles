local M = {
  "AndrewRadev/switch.vim",
  lazy = false,
  keys = {
    { "<leader>fb", ":Switch<CR>", desc = "Flip boolean/values" },
  },
  config = function()
    -- Define custom switch definitions
    vim.g.switch_custom_definitions = {
      { 'true', 'false' },
      { 'True', 'False' },
      { 'TRUE', 'FALSE' },
      { 'yes', 'no' },
      { 'Yes', 'No' },
      { 'on', 'off' },
      { 'On', 'Off' },
      { 'enable', 'disable' },
      { 'enabled', 'disabled' },
      { '+', '-' },
      { '>', '<' },
      { '>=', '<=' },
      { '==', '!=' },
    }
  end,
}

return M 