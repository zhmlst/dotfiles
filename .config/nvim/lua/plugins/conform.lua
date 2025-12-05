return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require "conform"
    conform.setup {
      formatters_by_ft = {
        go = { "goimports" },
        lua = { "stylua" },
        sh = { "shfmt" },
        rust = { "rustfmt" },
        json = { "jq" },
        jsonc = { "jq" },
      },
      format_on_save = true,
    }
  end,
}
