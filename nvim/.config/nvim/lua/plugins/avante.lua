return {
	"yetone/avante.nvim",
	cmd = { "Avante", "AvanteAsk", "AvanteNew" },
	lazy = false,
	version = false,
	build = "make BUILD_FROM_SOURCE=true",
	config = function()
		require("avante").setup({
			provider = "claude",
			endpoint = "https://api.anthropic.com",
			model = "claude-3-sonnet-20240229",
			temperature = 0.1,
			window = {
				border = "rounded",
				width = 0.8,
				height = 0.8,
				position = "center",
			},
			features = {
				sidebar = false,
				file_picker = false,
				context_menu = false,
				status_line = false,
			},
			chat = {
				auto_focus_input = false,
				keymaps = {
					close = "q",
					submit = "<C-s>",
					new_chat = "<C-n>",
				},
				auto_scroll = false,
			},
			buffer = {
				auto_attach = false,
				restore_state = false,
			},
			ui = {
				enable_cursor_hold_popup = false,
				enable_input_mode = false,
			},
		})
	end,
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
