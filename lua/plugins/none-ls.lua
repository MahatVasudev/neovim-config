return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			autostart = true,
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Go
				null_ls.builtins.formatting.golines,
				null_ls.builtins.diagnostics.golangci_lint,

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pyright,
			},
		})

		-- Format on save (safe)
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
