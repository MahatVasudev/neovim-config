local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>Y", '"+Y', opts)
keymap.set("i", "jk", "<Esc>")
-- Increment - Decrement

-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")
-- Normal mode
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Visual mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save File and Quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":bnext<CR>", opts)
keymap.set("n", "<s-tab>", ":bprev<CR>", opts)
keymap.set("n", "tw", ":bd<CR>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move windows
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Increase / decrease height
keymap.set("n", "<A-Up>", ":resize +2<CR>", opts) -- Alt + Up → taller
keymap.set("n", "<A-Down>", ":resize -2<CR>", opts) -- Alt + Down → shorter

-- Increase / decrease width
keymap.set("n", "<A-Right>", ":vertical resize +5<CR>", opts) -- Alt + Right → wider
keymap.set("n", "<A-Left>", ":vertical resize -5<CR>", opts) -- Alt + Left → narrower

-- Maximize current window
keymap.set("n", "<leader>sm", ":wincmd _ | wincmd |<CR>", opts)

-- Terminal
keymap.set("t", "<Esc>", [[<C-\><C-n>]])

keymap.set("n", "]q", ":cnext<CR>")
keymap.set("n", "[q", ":cprevious<CR>")

--
-- Diagnostics
--
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "=", "mzO<Esc>`z", { desc = "add blank line above" })
keymap.set("n", "_", "mzo<Esc>`z", { desc = "add blank line below" })
keymap.set("n", "<S-CR>", "m`O<Esc>``")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-b>", "<C-b>zz")

keymap.set("n", "<leader>rn", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative number" })

-- Open quickfix
keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Quickfix Open" })

-- Close quickfix
keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Quickfix Close" })

-- Toggle quickfix and populate with current LSP diagnostics
keymap.set("n", "<leader>cq", function()
	vim.diagnostic.setqflist({ open = true, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Diagnostics → Quickfix" })

-- Jump to next / previous quickfix item
keymap.set("n", "]q", ":cnext<CR>", { desc = "Next Quickfix" })
keymap.set("n", "[q", ":cprevious<CR>", { desc = "Prev Quickfix" })

-- Optional: jump through LSP diagnostics without populating quickfix
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- TODO-COMMENTS

-- Jump between TODOs
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

if vim.g.strict_mode then
	local function arrow_missing()
		vim.notify("Use hjkl / motions instead of arrows!!", vim.log.levels.WARN)
		return ""
	end
	-- Disable arrow keys in normal mode
	vim.keymap.set("n", "<Up>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("n", "<Down>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("n", "<Left>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("n", "<Right>", arrow_missing, { noremap = true, silent = true })
	-- Optional: also in insert mode
	vim.keymap.set("i", "<Up>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("i", "<Down>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("i", "<Left>", arrow_missing, { noremap = true, silent = true })
	vim.keymap.set("i", "<Right>", arrow_missing, { noremap = true, silent = true })
end
