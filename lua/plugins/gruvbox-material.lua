-- gruvbox-material.lua
return {
	"sainnhe/gruvbox-material",
	priority = 1000, -- load early
	lazy = false, -- load during startup
	config = function()
		-- Basic settings
		vim.o.background = "dark"
		vim.g.gruvbox_material_background = "hard" -- darker background
		vim.g.gruvbox_material_foreground = "material" -- use 'material' for smoother colors
		vim.g.gruvbox_material_enable_bold = true
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_disable_italic_comment = false
		vim.g.gruvbox_material_ui_contrast = "high" -- make popup menu, statuslines stand out
		vim.g.gruvbox_material_statusline_style = "mix" -- 'default', 'mix', 'original'
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored" -- or 'grey'

		-- Apply the colorscheme
		-- vim.cmd.colorscheme("gruvbox-material")

		-- Example: Set background to a custom hex color (dark gray)
		vim.api.nvim_set_hl(0, "Normal", { bg = "#181818", fg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "#181818", fg = "#3c3836" })
	end,
}
