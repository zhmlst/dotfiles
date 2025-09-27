local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  "neovim/nvim-lspconfig",
  config = function()
    local keys = require "config.keys"
    keys.map("n", "K", vim.lsp.buf.hover)
    keys.map("n", "<leader>r", vim.lsp.buf.rename)
    keys.map("n", "gd", vim.lsp.buf.definition)
    keys.map("n", "gr", vim.lsp.buf.references)
    keys.map("n", "gi", vim.lsp.buf.implementation)
    vim.diagnostic.config {
      virtual_text = {
        prefix = "//",
        spacing = 0,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    }

    -- lua
    vim.lsp.config("lua_ls", {
      capabilities = cmp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    vim.lsp.enable { "lua_ls" }

    -- gopls
    vim.lsp.config("gopls", {
      capabilities = cmp_capabilities,
      settings = {
        gopls = {
          analyses = {
            unreachable_code = true,
            unusedparams = true,
            deprecated = true,
            shadow = true,
            nilless = true,
          },
          completeUnimported = true,
        },
      },
    })
    vim.lsp.enable { "gopls" }

    -- rust-analyzer
    vim.lsp.config("rust_analyzer", {
      capabilities = cmp_capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          checkOnSave = true,
          completion = {
            autoimport = { enable = true },
          },
          diagnostics = {
            enable = true,
            enableExperimental = true,
          },
          procMacro = { enable = true },
        },
      },
    })
    vim.lsp.enable { "rust_analyzer" }

    vim.lsp.config("buf_ls", {
      capabilities = cmp_capabilities,
      root_dir = vim.fs.dirname(vim.fs.find({ "buf.yaml", ".git" }, { upward = true })[1]),
    })
    vim.lsp.enable { "buf_ls" }
  end,
}
