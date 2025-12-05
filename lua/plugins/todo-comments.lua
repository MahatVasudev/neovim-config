return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,     -- show icons in the sign column
    highlight = {
      multiline = false, -- highlights only the first line of multiline todo
    },
    keywords = {
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
      PERF = { icon = " ", color = "hint", alt = { "PERFORMANCE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    colors = {
      error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
      warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
      info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
      hint = { "LspDiagnosticsDefaultHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
    },
  },
}
