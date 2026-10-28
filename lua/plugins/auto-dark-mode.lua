-- Lua
return {
	"f-person/auto-dark-mode.nvim",
  cond = not vim.env.TERMUX_VERSION,
	opts = {
		set_dark_mode = function()
			if not vim.g.is_tty then
				vim.opt.termguicolors = true
				vim.g.current_theme = "gruvbox-material"
			else
				vim.opt.termguicolors = false
				vim.g.current_theme = "blue"
			end

			require("theme").apply()
		end,
		set_light_mode = function()
			if not vim.g.is_tty then
				vim.opt.termguicolors = true
				vim.g.current_theme = "rose-pine-dawn"
			else
				vim.opt.termguicolors = false
				vim.g.current_theme = "blue"
			end

			require("theme").apply()
		end,
	},
}
