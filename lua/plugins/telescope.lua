return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			-- vim.keymap.set("n", "<C-p>", function()
			-- 	builtin.find_files({
			-- 		-- Set the cwd dynamically based on the current buffer's directory
			-- 		cwd = vim.fn.getcwd(),
			-- 	})
			-- end, {})

			vim.keymap.set("n", "<C-p>", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.getcwd(),

					attach_mappings = function(prompt_bufnr, map)
						local action_state = require("telescope.actions.state")
						local actions = require("telescope.actions")

						-- SHIFT+ENTER → create file
						map("i", "<S-CR>", function()
							local picker = action_state.get_current_picker(prompt_bufnr)
							local prompt = picker:_get_prompt()

							if prompt == "" then
								print("No filename entered")
								return
							end

							local path = vim.fn.getcwd() .. "/" .. prompt

							-- Create file if missing
							if vim.fn.filereadable(path) == 0 then
								vim.fn.writefile({}, path)
								print("Created file: " .. path)
							else
								print("File already exists: " .. path)
							end

							actions.close(prompt_bufnr)
							vim.cmd("edit " .. path)
						end)

						return true
					end,

					-- Add a visible reminder line in Telescope
					prompt_title = "Find or Create Files",
					results_title = "Shift + Enter to Create a New File",
				})
			end, {})

			vim.keymap.set("n", "<Leader>fH", function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.getcwd(),
					hidden = true, -- show hidden files
					no_ignore = true, -- include files normally ignored by gitignore
					follow = true, -- follow symlinks (optional)
					find_command = {
						"fd",
						"--hidden",
						"--no-ignore",
						"--type",
						"f",
						"--exclude",
						".git",
					},
					results_title = "Hidden Files Only",
				})
			end, { desc = "Find Only Hidden Files" })

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
