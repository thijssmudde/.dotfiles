return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      priority = 1000, -- Make sure it loads early
      opts = {
        settings = {
          -- Specify TSServer settings here
          typescript = {
            format = {
              indentSize = 2,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
        on_attach = function(client, bufnr)
          -- keybind options
          local opts = { noremap = true, silent = true, buffer = bufnr }
        
          -- set keybinds
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- find references
          vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
          vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
          vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
          vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- peek definition
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
          vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
          vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
          vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
          vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
          vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
          vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
          vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
          vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
        
          -- typescript specific keymaps (e.g. rename file and update imports)
          if client.name == "typescript-tools" then
            vim.keymap.set("n", "<leader>mi", ":TypescriptAddMissingImports<CR>") -- 
            vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
            vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
            vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
          end
        end,
      },
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- This plugin only handles TypeScript via typescript-tools.nvim
    -- Mason and other LSP configs are handled by separate plugins
  end,
} 