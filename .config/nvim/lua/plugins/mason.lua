return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not ok then
        vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
        return
      end

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "gopls" },
        automatic_installation = true,
      })
    end,
  },
}
