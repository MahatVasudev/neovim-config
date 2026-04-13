return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.install").compilers = { "clang", "gcc", "clangd" }
		local config = require("nvim-treesitter.configs")

		config.setup({

			ensure_installed = { "javascript", "go", "lua" },
			auto_install = true,
			highlight = {
				enable = not vim.g.disable_highlight,
				additional_vim_regex_highlighting = not vim.g.disable_highlight,
			},

			query_linter = {
				enable = not vim.g.disable_highlight,
				use_virtual_text = not vim.g.disable_highlight,
				lint_events = { "BufWrite", "CursorHold" },
			},
		})
	end,
}
