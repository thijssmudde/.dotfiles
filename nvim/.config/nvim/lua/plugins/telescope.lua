local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

function M.config()
  local status, telescope = pcall(require, "telescope")
  if not status then
    return
  end

  -- import telescope actions safely
  local actions_setup, actions = pcall(require, "telescope.actions")
  if not actions_setup then
    return
  end

  -- configure telescope
  telescope.setup({
    -- configure custom mappings
    defaults = {
      cache_picker = {
        num_pickers = 20, -- number of pickers to cache
      },
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
          ["<C-u>"] = false, -- clear input
        },
      },
      file_ignore_patterns = {
        "node_modules",
        "build",
        "dist",
        "yarn.lock",
        ".git",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
      grep_string = {
        hidden = true,
      },
    },
  })

  -- Load the fzf extension (with error handling)
  pcall(telescope.load_extension, "fzf")
end

return M
