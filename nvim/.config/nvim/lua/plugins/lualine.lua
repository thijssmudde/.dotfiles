local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	local status, lualine = pcall(require, "lualine")
	if not status then
		return
	end

	lualine.setup()
end

return M
