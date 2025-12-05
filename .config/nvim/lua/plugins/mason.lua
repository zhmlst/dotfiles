return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          --lua
          "lua-language-server",
          "stylua",
          --golang
          "goimports",
          "gopls",
          "golangci-lint",
          --buf
          "buf",
          --sh
          "shfmt",
          "shellcheck",
        },
        auto_update = true,
        run_on_start = true,
      }
    end,
  },
}
