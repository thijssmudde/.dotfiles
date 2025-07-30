return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        
        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)
        
        -- Remove the minus key mapping and make it toggle instead
        vim.keymap.set("n", "-", ":NvimTreeToggle<CR>", { buffer = bufnr, nowait = true })
      end,
      filters = {
        dotfiles = false,  -- Show dotfiles
        exclude = { ".git", ".cache" }  -- Exclude specific dotfiles if desired
      },
      git = {
        enable = true,
        ignore = false,  -- Set to false to show ignored files (like .env)
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
      update_focused_file = {
        enable = true,          -- Enable this feature
        update_root = true,     -- Update the root directory if needed
        ignore_list = {},       -- List of buffer names / filetypes to ignore
      },
      view = {
        width = 30,
        relativenumber = true,
      },
    })
  end
}
