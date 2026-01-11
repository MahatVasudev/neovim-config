return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
		config = function()
			require("cokeline").setup({

				default_hl = {
					fg = function(buffer)
						return buffer.is_focused and "#ECEFF4" or "#616E88"
					end,
					bg = "#2E3440",
				},

				components = {
					{
						text = function(buffer)
							return " " .. buffer.devicon.icon
						end,
						fg = function(buffer)
							return buffer.devicon.color
						end,
					},
					{
						text = function(buffer)
							return buffer.filename .. " "
						end,
						style = function(buffer)
							return buffer.is_focused and "bold" or nil
						end,
					},
					{
						text = "X ",
						on_click = function(_, _, _, _, buffer)
							buffer:delete()
						end,
					},
				},
				vim.keymap.set("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true }),
				vim.keymap.set("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true }),
				vim.keymap.set("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true }),
				vim.keymap.set("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true }),
				vim.keymap.set("n", "<Leader>q", ":<C-U>bprevious <bar> bdelete #<CR>", { silent = true }),
			})
		end,
	},
}
