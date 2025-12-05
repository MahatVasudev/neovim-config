return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = { enabled = true }, -- enhances `/` and `?`
			char = { enabled = true }, -- enhances f/F/t/T
		},
	},
	keys = {
		-- Flash jump
		{
			"<leader>b",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},

		-- Treesitter text-object jumping
		{
			"<leader>B",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},

		-- Remote flash: edit text in other window without jumping physically
		--
		{
			"<leader>r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},

		-- Flash current search results
		{
			"<leader>ss",
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
	},
}
