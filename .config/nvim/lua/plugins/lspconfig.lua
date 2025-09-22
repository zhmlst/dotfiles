return {
  "neovim/nvim-lspconfig",
  config = function()
    local mappings = require "config.mappings"
    mappings.map("n", "K", vim.lsp.buf.hover)
    mappings.map("n", "rn", vim.lsp.buf.rename)
    --diagnostics
    vim.diagnostic.config {
      virtual_text = {
        prefix = "//",
        spacing = 0,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    }
    --golang
    require("lspconfig").gopls.setup {
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
    }
    --rust
    require("lspconfig").rust_analyzer.setup {
      settings = {
        ["rust-analyzer"] = {
          assist = { importGranularity = "module" },
          cargo = { features = "all" },
          procMacro = { enable = true },
        },
      },
    }
  end,
}
