vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus,unnamed")
vim.cmd("let g:auto_save=1")
vim.cmd("set autoindent")
-- vim.cmd("abbr @@ mahatvasudev@gmail.com")
-- vim.cmd("set winbar?")

--
vim.g.mapleader = " "
vim.g.current_theme = "catppuccin"
vim.g.strict_mode = true -- Use it to avoid using up, down, left right arrows
vim.g.transparent_background = true

vim.g.disable_dir_session = false
--
vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
-- vim.opt.backup= true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 0

vim.opt.expandtab = true
vim.opt.scrolloff = 10

-- vim.opt.incommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.formatoptions:append({ "r" })
