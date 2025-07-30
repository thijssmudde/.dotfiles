return {
	-- Colorscheme
	require("plugins.github-theme"),

	-- Plugin manager
	"folke/lazy.nvim",

	-- Dependencies
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	-- UI Elements
	require("plugins.bufferline"),
	require("plugins.lualine"),

	-- AI Assistant
	require("plugins.avante"),

	-- Session Management
	require("plugins.persistence"),

	-- File Explorer
	require("plugins.nvim-tree"),

	-- Fuzzy Finder
	require("plugins.telescope"),

	-- LSP
	require("plugins.lsp"),
	require("plugins.lspsaga"),

	-- Formatting & Linting
	require("plugins.null-ls"),

	-- Completion
	require("plugins.cmp"),

	-- Treesitter
	require("plugins.treesitter"),

	-- TypeScript handled by plugins/lsp.lua

	-- Git
	require("plugins.gitsigns"),

	-- Utilities
	require("plugins.autopairs"),
	require("plugins.comment"),
	require("plugins.colorizer"),
	require("plugins.hologram"),
	require("plugins.prettier"),
	require("plugins.bufdelete"),
	require("plugins.switch"),
	require("plugins.toggle-bool"),
	require("plugins.jester"),
	require("plugins.jumpwire"),
	require("plugins.minimove"),

	-- Tmux Navigation
	require("plugins.tmux-navigator"),

	-- Multiple Cursor
	require("plugins.vim-visual-multi"),

	-- Utilities
	require("plugins.surround"),
}
