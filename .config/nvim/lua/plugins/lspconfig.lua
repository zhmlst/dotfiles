local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  "neovim/nvim-lspconfig",
  config = function()
    local keys = require "config.keys"
    keys.map("n", "K", vim.lsp.buf.hover)
    keys.map("n", "<leader>r", vim.lsp.buf.rename)
    keys.map("n", "gd", vim.lsp.buf.definition)
    keys.map("n", "gr", vim.lsp.buf.references)
    keys.map("n", "gi", vim.lsp.buf.implementation)
    keys.map("n", "<leader>l", "<cmd>LspRestart<cr><cmd>e<cr>")
    vim.keymap.del("n", "grt")
    vim.keymap.del("n", "gcc")
    vim.keymap.del("n", "gra")
    vim.keymap.del("n", "gri")
    vim.keymap.del("n", "grr")
    vim.keymap.del("n", "grn")
    vim.keymap.del("x", "gra")

    vim.diagnostic.config {
      virtual_text = {
        prefix = "//",
        spacing = 0,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    }

    -- lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    vim.lsp.enable { "lua_ls" }

    -- go
    vim.lsp.config("gopls", {
      capabilities = capabilities,
      settings = {
        gopls = {
          buildFlags = { "-tags=integration" },
          analyses = {
            unreachable_code = true,
            unusedparams = true,
            deprecated = true,
            shadow = true,
            nilless = true,
          },
          completeUnimported = true,
        },
      },
    })
    vim.lsp.enable { "gopls" }
    --
    vim.api.nvim_create_user_command("Goflags", function(opts)
      local flags = {}
      if opts.args ~= "" then
        for s in opts.args:gmatch "%S+" do
          table.insert(flags, s)
        end
      end

      local clients = vim.lsp.get_clients { name = "gopls" }
      for _, client in ipairs(clients) do
        client.config.settings.gopls.buildFlags = flags
        client.notify("workspace/didChangeConfiguration", {
          settings = client.config.settings,
        })
        print("Gopls buildFlags updated to: " .. (opts.args ~= "" and opts.args or "empty"))
      end
    end, { nargs = "*" })

    -- rust
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          checkOnSave = true,
          completion = {
            callable = { snippets = "none" },
            postfix = { enable = false },
            autoimport = { enable = true },
          },
          diagnostics = {
            enable = true,
            enableExperimental = true,
          },
          procMacro = { enable = true },
        },
      },
    })
    vim.lsp.enable { "rust_analyzer" }

    --protobuf
    vim.lsp.config("buf_ls", {
      capabilities = capabilities,
      root_dir = vim.fs.dirname(vim.fs.find({ "buf.yaml", ".git" }, { upward = true })[1]),
    })
    vim.lsp.enable { "buf_ls" }
  end,
}
