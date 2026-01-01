return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			-- Animation style
			stages = "fade_in_slide_out", -- smooth fade + slide out

			-- Timeout for each notification
			timeout = 2500,

			-- Background color
			background_colour = "#000000",

			-- Minimum log level to show
			level = "INFO",

			-- Icons for each log level
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},

			-- Maximum width/height
			max_width = 80,
			max_height = 15,

			-- Border style
			render = "default",

			-- Optional transparency
			-- opacity = 0.8,
		})

		-- Make notify the default provider
		vim.notify = notify

		-- Keymap: view previous notifications
		vim.keymap.set("n", "<leader>no", function()
			require("notify").history()
		end, { desc = "Open Notification History" })

		-- Keymap: dismiss all notifications
		vim.keymap.set("n", "<leader>nd", function()
			require("notify").dismiss()
		end, { desc = "Dismiss All Notifications" })

		-- Optional: shortcut to toggle a test notification
		vim.keymap.set("n", "<leader>nt", function()
			vim.notify("Test notification!", vim.log.levels.INFO)
		end, { desc = "Test Notification" })
	end,
}
