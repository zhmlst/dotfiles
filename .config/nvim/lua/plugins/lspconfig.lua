return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("mason-lspconfig").setup()

      local servers = {
        lua_ls = {
          settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        },
        gopls = {},
        rust_analyzer = {},
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities

        vim.lsp.config(server, config)

        vim.lsp.enable(server)
      end
    end,
  },
}
