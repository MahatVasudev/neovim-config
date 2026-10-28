return {
	"dnlhc/glance.nvim",
	cmd = "Glance",
	lazy = false,
	config = function()
		require("glance").setup({})

		vim.keymap.set("n", "gr", "<CMD>Glance references<CR>", { desc = "References" })
		vim.keymap.set("n", "gy", "<CMD>Glance type_definitions<CR>", { desc = "Type Definition" })
		vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", { desc = "Go to Definition" })
		vim.keymap.set("n", "gm", "<CMD>Glance implementations<CR>")
	end,
}
