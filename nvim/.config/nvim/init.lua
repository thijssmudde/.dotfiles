-- Enable termguicolors before loading plugins
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim with options
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	-- Ensure the colorscheme is installed before other plugins
	performance = {
			rtp = {
				reset = false,
			},
	},
})

-- Then load configurations
require("options")
require("autocmds")
require("core.keymaps")
require("consolelog")
