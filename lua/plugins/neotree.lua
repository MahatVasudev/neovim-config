return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      default_component_configs = {
        icon = {
          folder_closed = "", -- Icon for closed folders
          folder_open = "", -- Icon for open folders
          folder_empty = "", -- Icon for empty folders
          default = "", -- Default file icon
          highlight = "NeoTreeFileIcon", -- Highlight group for icons
        },
        git_status = {
          symbols = {
            -- Change type
            added = "✚",
            deleted = "✖",
            modified = "",
            renamed = "󰁕",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
          highlight = "NeoTreeGitModified",
          align = "right",
        },
      },
      renderers = {
        directory = {
          { "icon" },
          { "current_filter" },
          { "name" },
          { "git_status",    align = "right" },
          { "diagnostics",   errors_only = true },
        },
        file = {
          { "icon" },
          { "name",       use_git_status_colors = true },
          { "git_status", align = "right" },
          { "diagnostics" },
        },
      },
    })

    vim.cmd("highlight NeoTreeFileIcon guifg=#FF0000")
    vim.cmd("highlight NeoTreeDirectoryIcon guifg=#FF0000")
    -- vim.cmd("highlight NeoTreeDirectoryName guifg=#FF0000")
    -- vim.cmd("highlight NeoTreeFolderName guifg=#FF0000")

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
  end,
}
