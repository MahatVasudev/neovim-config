return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",    -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim",  -- Optional, for persistent history
		},
		config = function()
			require("cokeline").setup({
			vim.keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true }),
			vim.keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true }),
			vim.keymap.set("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true }),
			vim.keymap.set("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true }),
			vim.keymap.set("n", "<Leader>q", ":<C-U>bprevious <bar> bdelete #<CR>", {silent = true})
			})
		end,
	},
}
