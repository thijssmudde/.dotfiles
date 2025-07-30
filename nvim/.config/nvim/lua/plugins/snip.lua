local M = {}

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node

local types = require("luasnip.util.types")
-- local conds = require "luasnip.extras.expand_conditions"

local function create_snippets()
	ls.snippets = {
		all = {
			s("ttt", t("Testing Luasnip")),
		},
		lua = {
			ls.parser.parse_snippet("lm", "local M = {}\n\nfunction M.setup()\n  $1 \nend\n\nreturn M"),
			-- s("lm", { t { "local M = {}", "", "function M.setup()", "" }, i(1, ""), t { "", "end", "", "return M" } }),
		},
		python = {},
	}
end

function M.setup()
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,

		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<-", "Error" } },
				},
			},
		},
	})

	-- Load snippets
	require("luasnip/loaders/from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()

	ls.filetype_extend("all", { "_" })

	-- Create new snippets
	create_snippets()
end

return M
