return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,

			styles = {
				comments = { "italic" },
				functions = { "bold" },
				keywords = { "bold" },
			},

			-- REMOVE blue identity
			color_overrides = {
				mocha = {
					base = "#0B0B0E",
					mantle = "#09090C",
					crust = "#07070A",

					text = "#F2F2F2",
					subtext1 = "#C8C8C8",
					subtext0 = "#A0A0A0",

					red = "#E02420",
					maroon = "#FF3C38",
					yellow = "#FFDD00",
					peach = "#FF5F00",

					-- kill blues
					sky = "#F2F2F2",
					sapphire = "#F2F2F2",
					blue = "#F2F2F2",
					lavender = "#F2F2F2",
				},
			},

			highlight_overrides = {
				mocha = function(c)
					return {
						-- === CORE UI ===
						Normal = { bg = c.base, fg = c.text },
						NormalFloat = { bg = c.mantle },
						FloatBorder = { fg = c.red },

						CursorLine = { bg = "#1A1A22" },
						CursorLineNr = { fg = c.red, bold = true },
						LineNr = { fg = "#44444F" },

						-- === SELECTION / SEARCH ===
						Visual = { bg = "#2A2A35" },
						Search = { bg = c.red, fg = c.base, bold = true },
						IncSearch = { bg = c.yellow, fg = c.base, bold = true },

						-- === DIAGNOSTICS (NO BLUE) ===
						DiagnosticError = { fg = c.red, bold = true },
						DiagnosticWarn = { fg = c.peach, bold = true },
						DiagnosticInfo = { fg = c.yellow },
						DiagnosticHint = { fg = c.text },

						-- === TITLES / HEADERS ===
						Title = { fg = c.red, bold = true },
						AlphaHeader = { fg = c.red, bold = true },

						-- === TELESCOPE (GRAPHIC STYLE) ===
						TelescopeBorder = { fg = c.red },
						TelescopePromptBorder = { fg = c.red },
						TelescopePromptTitle = { fg = c.red, bold = true },
						TelescopeResultsTitle = { fg = c.yellow },
						TelescopeSelection = { bg = "#1E1E28", bold = true },

						-- === GIT ===
						GitSignsAdd = { fg = "#3AFF5F" },
						GitSignsChange = { fg = c.yellow },
						GitSignsDelete = { fg = c.red },

						-- === COMPLETION ===
						CmpItemAbbrMatch = { fg = c.red, bold = true },
						CmpItemKindFunction = { fg = c.red },
						CmpItemKindVariable = { fg = c.text },
					}
				end,
			},

			integrations = {
				telescope = true,
				lualine = true,
				treesitter = true,
				cmp = true,
				gitsigns = true,
				neotree = true,
				alpha = true,
				notify = true,
			},
		})
	end,
}
