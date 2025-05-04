return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Import cmp_nvim_lsp for enhanced LSP capabilities
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Add snippet support (if using a snippet engine like LuaSnip)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Enable semantic tokens
      capabilities.textDocument.semanticTokens = {
        dynamicRegistration = false,
        requests = {
          range = true,
          full = { delta = true },
        },
      }

      -- Enable folding range support
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Setup LSP servers with enhanced capabilities
      local lspconfig = require("lspconfig")

      local servers = {
        "lua_ls",                          -- Lua
        "gopls",                           -- Go
        "tailwindcss",                     -- TailwindCSS
        "docker_compose_language_service", -- Docker Compose
        "clangd",                          -- C/C++
        "pyright",                         -- Python
        "rust_analyzer",                   -- Rust
        "html",                            -- HTML
        "cssls",                           -- CSS
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Special configuration for TypeScript/JavaScript
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        end,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      -- Keymaps for LSP actions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Type Definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<Leader>di", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<Leader>fm", vim.lsp.buf.format, { desc = "Format Code" })
    end,
  },
}
