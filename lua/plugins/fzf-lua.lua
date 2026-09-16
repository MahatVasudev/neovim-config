return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- files / grep
		{
			"<leader>ff",
			function()
				local cur_buf_dir = vim.fn.expand("%:p:h")

				require("fzf-lua").files({
					actions = {
						["alt-enter"] = function(selected, opts)
							if selected and selected[1] and selected[1] ~= "" then
								require("fzf-lua.actions").file_edit(selected, opts)
								return
							end

							local query = opts.last_query
							if not query or query == "" then
								vim.notify("No filename typed", vim.log.levels.WARN)
								return
							end

							local target
							if query:find("/") then
								target = query
							else
								target = cur_buf_dir .. "/" .. query
							end

							target = vim.fn.fnamemodify(target, ":p")
							local dir = vim.fn.fnamemodify(target, ":h")

							if vim.fn.isdirectory(dir) == 0 then
								vim.fn.mkdir(dir, "p")
							end

							vim.cmd("edit " .. vim.fn.fnameescape(target))
						end,
					},
				})
			end,
			desc = "FZF Files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "FZF Live Grep",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "FZF Grep Word Under Cursor",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "FZF Buffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "FZF Help Tags",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "FZF Old Files",
		},
		{
			"<leader>f?",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "FZF Builtin Pickers",
		},

		-- git
		{
			"<leader>gs",
			function()
				require("fzf-lua").git_status()
			end,
			desc = "FZF Git Status",
		},
		{
			"<leader>gc",
			function()
				require("fzf-lua").git_commits()
			end,
			desc = "FZF Git Commits",
		},
		{
			"<leader>gb",
			function()
				require("fzf-lua").git_branches()
			end,
			desc = "FZF Git Branches",
		},

		-- lsp
		{
			"gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "FZF LSP References",
		},
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "FZF LSP Definitions",
		},
		{
			"<leader>ls",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "FZF LSP Document Symbols",
		},
		{
			"<leader>lw",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "FZF LSP Workspace Symbols",
		},
		{
			"<leader>ld",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "FZF Diagnostics (Buffer)",
		},
		{
			"<leader>lD",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "FZF Diagnostics (Workspace)",
		},
	},

	opts = {
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept",
				["tab"] = "toggle",
				["shift-tab"] = "toggle+up",
			},
		},
		grep = {
			rg_glob = true,
		},
	},
}
