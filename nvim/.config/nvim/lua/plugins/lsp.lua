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
          -- TSServer settings
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierPreference = "shortest",
            quotePreference = "auto",
          },
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
          typescript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              trimTrailingWhitespace = true,
              insertSpaceAfterSemicolonInForStatements = true,
              insertSpaceBeforeAndAfterBinaryOperators = true,
              insertSpaceAfterCommaDelimiter = true,
              insertSpaceAfterKeywordsInControlFlowStatements = true,
              insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
              insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
              insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
              insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
              insertSpaceAfterTypeAssertion = false,
              insertSpaceBeforeFunctionParenthesis = false,
              placeOpenBraceOnNewLineForFunctions = false,
              placeOpenBraceOnNewLineForControlBlocks = false,
              insertSpaceBeforeTypeAnnotation = false,
              indentMultiLineObjectLiteralBeginningOnBlankLine = false,
              semicolons = "insert",
            },
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              trimTrailingWhitespace = true,
              insertSpaceAfterSemicolonInForStatements = true,
              insertSpaceBeforeAndAfterBinaryOperators = true,
              insertSpaceAfterCommaDelimiter = true,
              insertSpaceAfterKeywordsInControlFlowStatements = true,
              insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
              insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
              insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
              insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
              insertSpaceAfterTypeAssertion = false,
              insertSpaceBeforeFunctionParenthesis = false,
              placeOpenBraceOnNewLineForFunctions = false,
              placeOpenBraceOnNewLineForControlBlocks = false,
              insertSpaceBeforeTypeAnnotation = false,
              indentMultiLineObjectLiteralBeginningOnBlankLine = false,
              semicolons = "insert",
            },
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
          expose_as_code_action = "all",
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
            vim.keymap.set("n", "<leader>mi", ":TSToolsAddMissingImports<CR>", opts) -- add missing imports
            vim.keymap.set("n", "<leader>rf", ":TSToolsRenameFile<CR>", opts) -- rename file and update imports
            vim.keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- organize imports
            vim.keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts) -- remove unused variables
            vim.keymap.set("n", "<leader>fx", ":TSToolsFixAll<CR>", opts) -- fix all auto-fixable problems
            vim.keymap.set("n", "<leader>gs", ":TSToolsGoToSourceDefinition<CR>", opts) -- go to source definition
            vim.keymap.set("n", "<leader>rF", ":TSToolsFileReferences<CR>", opts) -- find file references
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