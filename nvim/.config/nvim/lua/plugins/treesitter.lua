vim.g.skip_ts_context_commentstring_module = true

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "simrat39/symbols-outline.nvim",
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  priority = 1000,
  config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end
    
    local ts_context_status, ts_context = pcall(require, "ts_context_commentstring")
    
    -- Force installation of parsers
    local parser_install = require("nvim-treesitter.install")
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    
    parser_install.prefer_git = true
    
    treesitter.setup({
      ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "tsx",
        "html",
        "css",
        "json",
        "markdown",
        "markdown_inline",
        "regex",
        "jsdoc",
      },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })

    -- Configure symbols outline
    require("symbols-outline").setup({
      auto_open = true,
      width = 25,
      position = 'right'
    })

    if ts_context_status then
        ts_context.setup({
            enable_autocmd = false,
        })
    end
  end,
}
