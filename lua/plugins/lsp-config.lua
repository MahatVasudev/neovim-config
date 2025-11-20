return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- FIXED: Correct plugin name
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },

  -- FIXED: Correct plugin name
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Import cmp_nvim_lsp for enhanced LSP capabilities
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Add snippet support
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

      local lspconfig = require("lspconfig")
      local servers = {
        "lua_ls",
        "gopls",
        "tailwindcss",
        "docker_compose_language_service",
        "clangd",
        "pylsp",
        "rust_analyzer",
        "html",
        "cssls",
        "prismals",
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- TypeScript/JavaScript special setup
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = function(_, bufnr)
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

      -- LSP keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = "Type Definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<Leader>di", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<Leader>fm", vim.lsp.buf.format, { desc = "Format Code" })
    end,
  },
}
