local M = {}

function M.apply()
	local theme = vim.g.current_theme or "tokyonight"

	if vim.g.transparent_background then
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
	end
	vim.cmd.colorscheme(theme)
end

return M
