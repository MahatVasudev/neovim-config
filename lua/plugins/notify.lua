return {

  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    notify.setup({
      -- Animation style
      stages = "fade_in_slide_out", -- smooth + modern

      -- Notification timeout (ms)
      timeout = 2500,

      -- Background (fits your all-black theme)
      background_colour = "#000000",

      -- Minimum level to show (INFO/WARN/ERROR)
      level = "INFO",

      -- Icons for cyberpunk style
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },

      -- Maximum popup width/height
      max_width = 60,
      max_height = 10,

      -- Render shape of the border
      render = "default",

      -- Optional transparency if you want glass-look
      -- uncomment if needed:
      -- opacity = 0.8,
    })

    -- Make notify the default notification provider
    vim.notify = notify

    -- Keymap to view previous notifications
    vim.keymap.set("n", "<leader>no", function()
      require("notify").history()
    end, { desc = "Open Notification History" })
  end,
}
