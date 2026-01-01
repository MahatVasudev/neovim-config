return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			terminal_colors = true,

			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = { bold = true },
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},

			-- 🎨 Core color tuning (THIS is the Persona feel)
			on_colors = function(colors)
				colors.bg = "#0b1220" -- deep moonlit blue
				colors.bg_dark = "#080e1a"
				colors.bg_float = "#0b1220"
				colors.bg_sidebar = "#080e1a"
				colors.bg_highlight = "#132042"

				colors.fg = "#e6ebff" -- crisp white-blue
				colors.fg_dark = "#a9b1d6"
				colors.fg_gutter = "#3b4261"

				colors.blue = "#7aa2f7" -- Persona blue
				colors.cyan = "#7dcfff" -- soft glow cyan
				colors.purple = "#9d7cd8" -- subtle velvet purple
			end,

			-- ✨ Highlight shaping (where the vibe really locks in)
			on_highlights = function(hl, c)
				-- Cursor & focus
				hl.CursorLine = { bg = "#10182d" }
				hl.CursorColumn = { bg = "#10182d" }
				hl.CursorLineNr = { fg = c.cyan, bold = true }

				-- Line numbers (quiet, clean)
				hl.LineNr = { fg = "#2f3b6b" }

				-- Floating windows (Persona UI panels)
				hl.NormalFloat = { bg = "#0b1220" }
				hl.FloatBorder = { fg = c.cyan, bg = "#0b1220" }

				-- Telescope = Persona menu screens
				hl.TelescopeBorder = { fg = c.cyan }
				hl.TelescopeSelection = { bg = "#132042", bold = true }
				hl.TelescopePromptBorder = { fg = c.blue }

				-- Diagnostics (calm, not alarming)
				hl.DiagnosticError = { fg = "#f7768e" }
				hl.DiagnosticWarn = { fg = "#e0af68" }
				hl.DiagnosticInfo = { fg = c.cyan }
				hl.DiagnosticHint = { fg = c.blue }

				-- Comments = reflective, subdued
				hl.Comment = { fg = "#6f7bb6", italic = true }

				-- TODO comments (mission markers)
				hl.Todo = { fg = c.cyan, bold = true }
			end,
		})
	end,
}
