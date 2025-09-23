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
        null_ls.builtins.formatting.buf,
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("NullLsFormat", { clear = true }),
      pattern = { "*.lua", "*.go", "*.sh", "*.proto" },
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
