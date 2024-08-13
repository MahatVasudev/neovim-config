
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			-- ensure_installed = { "lua", "javascript", "go", "python" },
			auto_install = true,
			highlight = { 
				enabled = true,
				disable = { "" },
				additional_vim_regex_highlighting = true
			},
			indent = { enable = true },

		})
	end,
}
