local M = {}

function M.apply()
	-- Create an autocommand to force transparency EVERY time a colorscheme changes
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			if vim.g.transparent_background then
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
			end
		end,
	})

	-- Fallback/Initial load if auto-dark-mode hasn't changed it yet
	local theme = vim.g.current_theme or "blue"
	vim.cmd.colorscheme(theme)
end

return M
