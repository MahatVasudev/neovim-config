return {
	"stevearc/resession.nvim",
	lazy = false,
	config = function()
		local resession = require("resession")

		resession.setup({
			-- Where sessions are stored
			dir = vim.fn.stdpath("state") .. "/sessions",

			-- Save and restore these
			autosave = {
				enabled = true,
				interval = 60, -- seconds
				notify = false,
			},

			-- Do not load sessions for these directories
			ignore_dirs = {
				"/",
				vim.fn.expand("~"),
			},
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- Only load the session if nvim was started with no args and without reading from stdin
				if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
					-- Save these to a different directory, so our manual sessions don't get polluted
					resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
				end
			end,
			nested = true,
		})
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				if not vim.g.disable_dir_session then
					resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
				end
			end,
		})
		vim.api.nvim_create_autocmd("StdinReadPre", {
			callback = function()
				-- Store this for later
				vim.g.using_stdin = true
			end,
		})
		-- ===== Keymaps =====

		-- Save session for current directory
		vim.keymap.set("n", "<leader>ss", function()
			resession.save(vim.fn.getcwd(), { notify = true })
		end, { desc = "Save session (cwd)" })

		-- Load session for current directory
		vim.keymap.set("n", "<leader>sl", function()
			resession.load(vim.fn.getcwd(), { notify = true })
		end, { desc = "Load session (cwd)" })

		-- Delete session for current directory
		vim.keymap.set("n", "<leader>sd", function()
			local resession = require("resession")
			local name = resession.get_current()
			local opts = { dir = "dirsession", notify = true }
			vim.g.disable_dir_session = true
			resession.delete(name, opts)
			vim.notify("Session deleted", vim.log.levels.INFO)
			vim.cmd("%bd!")
			require("alpha").start(false)
		end, { desc = "Delete session (cwd)" })

		-- Enable Auto Save feature
		vim.keymap.set("n", "<leader>se", function()
			vim.g.disable_dir_session = false
			vim.notify("Directory Session autosave re-enabled", vim.log.levels.INFO)
		end, { desc = "Re-enable auto save" })

		-- Session Clear
		vim.keymap.set("n", "<leader>sz", function()
			vim.cmd("normal! <leader>sd")
			vim.cmd("normal! <leader>se")
		end, { desc = "Clear Session and Auto Save Enable" })
	end,
}
