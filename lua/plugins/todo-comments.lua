return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	opts = {
		signs = true, -- show icons in the sign column
		highlight = {
			multiline = true, -- highlights only the first line of multiline todo
		},
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
			THOUGHT_PROCESS = { icon = " ", color = "thought", alt = { "TP", "THOUGHT", "FFT", "THINK" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
			PERF = { icon = " ", color = "perf", alt = { "PERFORMANCE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = " ", color = "test", alt = { "TESTING" } },
			SEC = { icon = "󰒃 ", color = "error", alt = { "SECURITY", "VULN" } },
			IMPORTANT = { icon = "󱙲 ", color = "important", alt = { "IMPORTANT!", "CRITICAL", "IMP" } },
		},

		-- FIX:
		-- FIXME: Any Errors That needs fixing
		-- BUG:

		-- TODO: A pending task

		-- HACK: A Bad Code

		-- WARN: Self explainatory
		-- WARNING:

		-- PERF:
		-- PERFORMANCE: Needs Optimization

		-- NOTE: Show Information
		-- INFO:

		-- TEST: Testing Code
		-- TESTING:

		-- SEC:
		-- SECURITY: A detected vulnaribility or security issue
		-- VULN:

		-- IMPORTANT: An important concept
		-- CRITICAL: This is something critical
		-- IMPORTANT!: Super Important
		-- IMP: Short form

		-- THOUGHT:
		-- TP:
		-- FFT:
		-- THINK:

		colors = {
			error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
			warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
			info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
			hint = { "LspDiagnosticsDefaultHint", "#10B981" },
			perf = { "#F97316" },
			test = { "#8B5CF6" },
			thought = { "#29739f", "LspDiagnosticsDefaultInformation" },
			default = { "Identifier", "#7C3AED" },
			important = { "#EF4444", "LspDiagnosticsDefaultError" }, -- Bright red (matches error intensity but distinct)
		},
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		require("telescope").load_extension("todo-comments")

		vim.keymap.set("n", "<leader>ft", function()
			require("telescope").extensions["todo-comments"].todo({ severity = { "ERROR", "WARN" } })
		end, { desc = "Find TODOs" })

		vim.keymap.set("n", "<leader>fT", function()
			require("telescope").extensions["todo-comments"].todo({
				bufnr = 0,
			})
		end, { desc = "Find TODOs in Current Buffer" })
	end,
}
