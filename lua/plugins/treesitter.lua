return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	config = function()
		require("nvim-treesitter.install").compilers = { "clang", "gcc", "clangd" }
		local configs = require("nvim-treesitter.configs")

		configs.setup({

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

		vim.opt.foldmethod = "expr" -- Use expression for folding
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
		vim.opt.foldlevel = 99 -- Keep all folds open by default
	end,
}
