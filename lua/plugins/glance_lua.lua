return {
	"dnlhc/glance.nvim",
	cmd = "Glance",
	config = function()
		require("glance").setup({
			vim.keymap.set("n", "gR", "<CMD>Glance references<CR>", { desc = "References" }),
			vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>", { desc = "Type Definition" }),
			vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>", { desc = "Go to Definition" }),
		})
	end,
}
