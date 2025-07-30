-- 	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })

-- 	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
-- 	use("edluffy/hologram.nvim")

-- 	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
-- 	use({ "ojroques/nvim-bufdel" })

-- 	use({
-- 		"folke/persistence.nvim",
-- 		event = "BufReadPre", -- this will only start session saving when an actual file was opened
-- 		module = "persistence",
-- 		config = function()
-- 			require("persistence").setup()
-- 		end,
-- 	})

-- 	use({
-- 		"folke/which-key.nvim",
-- 		config = function()
-- 			vim.o.timeout = true
-- 			vim.o.timeoutlen = 300
-- 			require("which-key").setup({
-- 				-- your configuration comes here
-- 				-- or leave it empty to use the default settings
-- 				-- refer to the configuration section below
-- 			})
-- 		end,
-- 	})

-- 	use({
-- 		"folke/trouble.nvim",
-- 		requires = "kyazdani42/nvim-web-devicons",
-- 		config = function()
-- 			require("trouble").setup({
-- 				-- your configuration comes here
-- 				-- or leave it empty to use the default settings
-- 				-- refer to the configuration section below
-- 			})
-- 		end,
-- 	})

-- 	use("echasnovski/mini.move")

-- 	use("norcalli/nvim-colorizer.lua")

-- 	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

-- 	use("szw/vim-maximizer") -- maximizes and restores current window

-- 	-- essential plugins
-- 	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
-- 	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

-- 	-- commenting with gc
-- 	use("numToStr/Comment.nvim")
-- 	use("JoosepAlviste/nvim-ts-context-commentstring")

-- 	-- file explorer
-- 	use("nvim-tree/nvim-tree.lua")

-- 	-- vs-code like icons
-- 	use("nvim-tree/nvim-web-devicons")

-- 	-- statusline
-- 	use("nvim-lualine/lualine.nvim")

-- 	-- fuzzy finding w/ telescope
-- 	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
-- 	use({
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.4",
-- 		-- or                            , branch = '0.1.x',
-- 		requires = { { "nvim-lua/plenary.nvim" } },
-- 	})

-- 	-- autocompletion
-- 	use("hrsh7th/nvim-cmp") -- completion plugin
-- 	use("hrsh7th/cmp-buffer") -- source for text in buffer
-- 	use("hrsh7th/cmp-path") -- source for file system paths

-- 	-- snippets
-- 	use("L3MON4D3/LuaSnip") -- snippet engine
-- 	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
-- 	use("rafamadriz/friendly-snippets") -- useful snippets

-- 	-- managing & installing lsp servers, linters & formatters
-- 	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
-- 	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

-- 	-- configuring lsp servers
-- 	use("neovim/nvim-lspconfig") -- easily configure language servers
-- 	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
-- 	use({
-- 		"glepnir/lspsaga.nvim",
-- 		commit = "b7b4777",
-- 		branch = "main",
-- 		config = function()
-- 			require("lspsaga").setup({})
-- 		end,
-- 		requires = { { "nvim-tree/nvim-web-devicons" } },
-- 	})
-- 	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
-- 	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

-- 	-- formatting & linting
-- 	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
-- 	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

-- 	-- testing
-- 	use("David-Kunz/jester")
-- 	use("micmine/jumpwire.nvim")

-- 	-- treesitter configuration
-- 	use({
-- 		"nvim-treesitter/nvim-treesitter",
-- 		run = function()
-- 			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
-- 			ts_update()
-- 		end,
-- 	})

-- 	-- auto closing
-- 	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
-- 	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

-- 	-- git integration
-- 	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

-- 	if packer_bootstrap then
-- 		require("packer").sync()
-- 	end

-- 	-- Toggle boolean
-- 	use("AndrewRadev/switch.vim")
-- 	use("gerazov/vim-toggle-bool")
-- end)
