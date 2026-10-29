-- LEADER DEFINED AS SPACE --
vim.g.mapleader = " "
vim.g.maplocalleader = " "


if vim.env.TERMUX_VERSION then
  vim.g.clipboard = "termux"
elseif vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
else
  vim.g.clipboard = nil
end
