return {
  {
    "neko-night/nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
    
      vim.cmd([[colorscheme nekonight-deep-ocean]])
    end
  }
}
