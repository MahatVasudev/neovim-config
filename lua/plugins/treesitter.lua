
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  tag = "v0.9.1",
	config = function()
    local config = require("nvim-treesitter.configs")
		
    config.setup({
  
			ensure_installed = {  "javascript", "go", "python" },
			auto_install = true,
			highlight = { 
				enabled = true,
				additional_vim_regex_highlighting = true
			},

      disabled = { "lua" },
			indent = { enable = true },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite","CursorHold"}
      },
		})
	end,

-- Associate file types with parsers
vim.filetype.add({
  extension = {
    js = "javascript",
    jsx = "javascriptreact",  -- React specific highlighting
  },
})
}
