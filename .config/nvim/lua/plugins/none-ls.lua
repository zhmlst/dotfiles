return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("NullLsFormat", { clear = true }),
      buffer = bufnr,
      pattern = { "*.lua", "*.go", "*.sh" },
      callback = function()
        vim.lsp.buf.format {
          filter = function(client)
            return client.name == "null-ls" or client.name == "efm"
          end,
        }
      end,
    })
  end,
}
