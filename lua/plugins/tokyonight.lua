-- return {
-- 	-- Add the tokyonight theme plugin
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false,  -- load the theme immediately
-- 		priority = 1000, -- load it before other plugins
-- 		config = function()
-- 			require("tokyonight").setup({
-- 				style = "storm",       -- choose between "storm", "night", and "day"
-- 				transparent = true,    -- enable transparent background
-- 				terminal_colors = true, -- apply theme to terminal as well
-- 				styles = {
-- 					sidebars = "transparent", -- make sidebars (like NeoTree) transparent
-- 					floats = "transparent", -- make floating windows transparent
-- 				},
-- 				-- Add your custom settings here
-- 			})
--
-- 			-- Load the colorscheme
-- 			vim.cmd([[colorscheme tokyonight-storm]])
-- 		end,
-- 	},
-- }
