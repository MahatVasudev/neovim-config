return {
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup({
				type = "exp",
				cursor = "●",
				texthl = "DiagnosticInfo",
				speed = 25,
				fancy = {
					enable = true,
					head = { cursor = "●", texthl = "DiagnosticInfo" },
					tail = { cursor = "·", texthl = "Comment" },
				},
			})
		end,
	},
}
