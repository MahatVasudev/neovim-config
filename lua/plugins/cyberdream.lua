return {
	"scottmckendry/cyberdream.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("cyberdream").setup({

			variant = "dark",
			transparent = false,
			saturation = 1,
			hide_fillchars = true,
			borderless_pickers = false,
			terminal_colors = true,
			cache = false,

			colors = {
				bg = "#000000",
				fg = "#e6e6e6",

				red = "#d9383e", -- soft cyberpunk red
				magenta = "#c63cab", -- purple for comments
				green = "#4fffa6",
				yellow = "#f5e85c",
				blue = "#71b7ff",
				cyan = "#5ef1ff",

				dark = {
					red = "#d9383e",
					magenta = "#c63cab",
					fg = "#000000",
					bg = "#0a0a0a",
				},

				light = {
					red = "#ff6b6b",
					cyan = "#9ffcff",
				},
			},

			overrides = function(colors)
				return {
					Comment = { fg = colors.magenta, italic = true },
					["@property"] = { fg = colors.red, bold = true },

					["@lsp.type.variable"] = { fg = colors.fg },
					["@lsp.type.parameter"] = { fg = colors.cyan },
					["@lsp.type.function"] = { fg = colors.blue, bold = true },
					["@lsp.type.property"] = { fg = colors.red },
					Normal = { bg = colors.bg, fg = colors.fg },
					NormalFloat = { bg = colors.bg },

					LineNr = { fg = "#5a5a5a" },
					CursorLineNr = { fg = colors.red, bold = true },

					Todo = { fg = colors.yellow, bold = true },
				}
			end,

			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
		})
	end,
}
