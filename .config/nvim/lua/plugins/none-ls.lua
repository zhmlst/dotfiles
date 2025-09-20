return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- кастомный форматтер
    local vfmt = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "v" },
      generator = helpers.formatter_factory({
        command = "v",
        args = { "fmt", "-" },
        to_stdin = true,
      }),
    }

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.goimports,
        vfmt,
      },
      on_attach = function(client, bufnr)
        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
