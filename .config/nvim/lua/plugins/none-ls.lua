return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require "null-ls"
    local helpers = require "null-ls.helpers"

    local rustfmt = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "rust" },
      generator = helpers.formatter_factory {
        command = "rustfmt",
        args = { "--emit", "stdout" },
        to_stdin = true,
      },
    }

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.buf,
        rustfmt,
        require("none-ls.formatting.jq").with {
          filetypes = { "json", "jsonc" },
        },
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("NullLsFormat", { clear = true }),
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
