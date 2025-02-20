return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<C-p>", function()
				builtin.find_files({
					-- Set the cwd dynamically based on the current buffer's directory
					cwd = vim.fn.getcwd()
				})
			end, {})


      -- Keymap to dynamically prompt for a query
      vim.keymap.set("n", "<Leader>ws", function()
          vim.ui.input({ prompt = "Enter query: " }, function(query)
            if query then
            builtin.lsp_workspace_symbols({ query = query })
            else
            print("Query canceled or empty!")
            end
            end)
          end, { desc = "Search Workspace Symbols (dynamic query)" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<Leader>gs", builtin.git_status, { desc = "Git Status" })
      vim.keymap.set("n", "<Leader>gc", builtin.git_commits, { desc = "Git Commits" })
      vim.keymap.set("n", "<Leader>gb", builtin.git_branches, { desc = "Git Branches" })     
      vim.keymap.set("n", "<Leader>cp", ":Telescope commands<CR>", { desc = "Command Palette" })
      end,
  },
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					path_display = { "truncate" },
				},
				extensions = { -- Corrected the typo here
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
