-- Lua
return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		set_dark_mode = function()
			if not vim.g.is_tty then
				vim.opt.termguicolors = true
				vim.g.current_theme = "nekonight-deep-ocean"
			else
				vim.opt.termguicolors = false
				vim.g.current_theme = "blue"
			end

			require("theme").apply()
		end,
		set_light_mode = function()
			if not vim.g.is_tty then
				vim.opt.termguicolors = true
				vim.g.current_theme = "catppuccin-latte"
			else
				vim.opt.termguicolors = false
				vim.g.current_theme = "blue"
			end

			require("theme").apply()
		end,
	},
}
