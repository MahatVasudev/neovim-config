--
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function fg(name)
				local hl = vim.api.nvim_get_hl(0, { name = name })
				return hl.fg and string.format("#%06x", hl.fg) or nil
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					section_separators = "",
					component_separators = "",
					globalstatus = true,
					disabled_filetypes = { "alpha", "neo-tree" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							color = { fg = fg("DiagnosticInfo"), bg = "NONE" },
						},
					},
					lualine_b = {
						{ "branch", color = { fg = fg("DiagnosticHint"), bg = "NONE" } },
					},
					lualine_c = {
						{ "filename", color = { fg = fg("Normal"), bg = "NONE" } },
					},
					lualine_x = {
						{ "filetype", color = { fg = fg("Comment"), bg = "NONE" } },
					},
					lualine_y = {},
					lualine_z = {
						{ "location", color = { fg = fg("DiagnosticInfo"), bg = "NONE" } },
					},
				},
			})
		end,
	},
}
