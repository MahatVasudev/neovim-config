return {
	"JulianSchubel/nvim-notepad",
	lazy = false,
	cmd = { "Notepad" },
	keys = { "<leader>nn", "<cmd>Notepad<cr>", desc = "Open Neovim Notepad" },
	config = function()
		require("notepad").setup({
			layout = "float",
			width_ratio = 0.8,
			height_ratio = 0.8,
			split_width = 40,
			border = "rounded",
			archive = {
				enabled = true,
			},
		})
	end,
}
