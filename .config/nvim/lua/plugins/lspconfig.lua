local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    -- lua_lsp
    lspconfig.lua_ls.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- gopls
    lspconfig.gopls.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      settings = {
        gopls = {
          staticcheck = true,
          analyses = {
            unusedparams = true,
            shadow = true,
            nilness = true,
            unusedwrite = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    })
  end,
}
