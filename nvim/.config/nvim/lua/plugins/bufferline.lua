return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
    options = {
      mode = "buffers",
      separator_style = "slant",
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      diagnostics = "nvim_lsp",
    },
    highlights = {
      fill = {
        bg = "#0d1117",
      },
      background = {
        bg = "#0d1117",
      },
      tab = {
        bg = "#0d1117",
      },
      tab_selected = {
        bg = "#161b22",
      },
      buffer_visible = {
        bg = "#0d1117",
      },
      buffer_selected = {
        bg = "#161b22",
        bold = true,
        italic = false,
      },
      separator = {
        fg = "#0d1117",
        bg = "#0d1117",
      },
      separator_selected = {
        fg = "#0d1117",
        bg = "#161b22",
      },
      separator_visible = {
        fg = "#0d1117",
        bg = "#0d1117",
      },
    },
    })
  end,
}
