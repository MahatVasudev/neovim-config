local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

keymap.set("i", "jk", "<Esc>")
-- Increment - Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

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
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move windows
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

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

-- TODO-COMMENTS

-- Jump between TODOs
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Telescope integration
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find todos" })
