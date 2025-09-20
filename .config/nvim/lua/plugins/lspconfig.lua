local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local map = vim.keymap.set

      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>lr", "<cmd>LspRestart<cr>", opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
    end

    -- Lua Language Server
    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Go Language Server
    vim.lsp.config("gopls", {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
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

    -- V Language Server
    vim.lsp.config("v_analyzer", {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
      cmd = { mason_bin .. "/v-analyzer" },
      filetypes = { "v", "vsh", "vv" },
      single_file_support = true,
    })
  end,
}
