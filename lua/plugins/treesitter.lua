
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
    require("nvim-treesitter.install").compilers = {"clangd", "gcc"}
    local config = require("nvim-treesitter.configs")
		
    config.setup({
  
			ensure_installed = {  "javascript", "go", "lua"},
			auto_install = true,
			highlight = { 
				enabled = true,
				additional_vim_regex_highlighting = true
			},

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite","CursorHold"},
      },
		})
	end,

}
