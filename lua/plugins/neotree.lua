
return {
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v3.x", 
    dependencies = {
        "nvim-lua/plenary.nvim", 
        "nvim-tree/nvim-web-devicons", 
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("neo-tree").setup({
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
                        added     = "✚", 
                        deleted   = "✖",
                        modified  = "",
                        renamed   = "",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                    },
                    align = "right",
                },
            },
            renderers = {
              directory = {
                    { "icon" },
                    { "current_filter" },
                    { "name" },
                    { "diagnostics", errors_only = true },
                },
                file = {
                    { "icon" },
                    { "name", use_git_status_colors = true },
                    { "diagnostics" },
                },
            },
})
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>', {})
    end
}
