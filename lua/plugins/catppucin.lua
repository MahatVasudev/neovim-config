return {
	"catppuccin/nvim",
	name = "catpuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			integration = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
