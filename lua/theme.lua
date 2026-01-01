local M = {}

function M.apply()
	local theme = vim.g.current_theme or "tokyonight"
	vim.cmd.colorscheme(theme)
end

return M
