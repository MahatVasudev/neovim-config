local M = {}

-- Namespace for extmarks
local ns_id = vim.api.nvim_create_namespace("alternating_lines")

-- Function to draw alternating highlights on even lines
local function highlight_even_lines(bufnr)
	if not vim.g.alternative_line_color then
		return
	end
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	-- Skip non-normal buffers (e.g. NvimTree, Telescope, help files)
	if vim.bo[bufnr].buftype ~= "" then
		return
	end

	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

	local line_count = vim.api.nvim_buf_line_count(bufnr)
	for i = 1, line_count - 1, 2 do
		vim.api.nvim_buf_set_extmark(bufnr, ns_id, i, 0, {
			line_hl_group = "EvenLineHighlight",
			priority = 5, -- Lower priority than search/selection highlights
		})
	end
end

-- Sets up the highlight group based on the active theme
local function update_even_line_hl()
	if not vim.g.alternative_line_color then
		return
	end

	local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })

	-- If CursorLine has a background, use it; otherwise fall back to a subtle gray/blue
	local bg_color = cursorline.bg or normal.bg or "#1e1e2e"

	if vim.opt.termguicolors:get() then
		vim.api.nvim_set_hl(0, "EvenLineHighlight", {
			bg = bg_color,
			blend = vim.g.transparent_background and 15 or 0, -- Adds transparency blending if needed
			default = false,
		})
	else
		-- TTY Fallback (256/16 colors)
		vim.api.nvim_set_hl(0, "EvenLineHighlight", {
			ctermbg = 236, -- Subtle dark grey for TTY
			default = false,
		})
	end
end

function M.apply()
	local group = vim.api.nvim_create_augroup("ThemeAndAlternatingLines", { clear = true })

	-- 1. ColorScheme hook: Handles transparency & line highlights on theme change
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = group,
		pattern = "*",
		callback = function()
			if vim.g.transparent_background then
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", ctermbg = "NONE" })
			end

			-- Re-calculate the even line highlight color for the new theme
			update_even_line_hl()

			-- Re-apply to current buffer
			highlight_even_lines(0)
		end,
	})

	-- 2. Keep line highlights in sync as you type or switch buffers
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI" }, {
		group = group,
		callback = function(args)
			highlight_even_lines(args.buf)
		end,
	})

	-- 3. Initial colorscheme application
	local theme = vim.g.current_theme or "blue"
	vim.cmd.colorscheme(theme)
end

return M
