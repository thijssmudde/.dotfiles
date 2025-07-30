local M = {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
}

function M.init()
  -- Configure vim-visual-multi mappings
  vim.g.VM_maps = {
    -- Use Ctrl+N for VS Code style multi-cursor selection
    ["Find Under"] = "<C-n>",
    ["Find Subword Under"] = "<C-n>",
    -- Optional: Add other useful mappings  
    ["Skip Region"] = "<C-x>",
    ["Remove Region"] = "q",
  }
  
  -- Better search behavior
  vim.g.VM_default_mappings = 0
  vim.g.VM_mouse_mappings = 1
  vim.g.VM_case_setting = "smart"  -- Smart case matching
  
  -- Optional: Customize visual appearance
  vim.g.VM_theme = "iceblue"
  
  -- Optional: Show number of cursors in statusline
  vim.g.VM_show_warnings = 0
end

return M