return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			autostart = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.diagnostics.ast_grep,
				null_ls.builtins.diagnostics.golangci_lint,
			},
			 -- Auto-format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        }),


			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}),
		})
	end,
}
