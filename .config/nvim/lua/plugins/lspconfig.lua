return {
  "neovim/nvim-lspconfig",
  config = function()
    local keys = require "config.keys"
    keys.map("n", "K", vim.lsp.buf.hover)
    keys.map("n", "rn", vim.lsp.buf.rename)
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
      settings = {
        gopls = {
          analyses = {
            unreachable_code = true,
            unusedparams = true,
            deprecated = true,
            shadow = true,
          },
          completeUnimported = true,
          usePlaceholders = true,
          staticcheck = true,
        },
      },
    })
    vim.lsp.enable { "gopls" }

    vim.lsp.config("buf_ls", {})
    vim.lsp.enable { "buf_ls" }
  end,
}
