return {
    "neovim/nvim-lspconfig",
    config = function()
        local mappings = require "config.mappings"
        mappings.map("n", "K", vim.lsp.buf.hover)
        mappings.map("n", "rn", vim.lsp.buf.rename)
        mappings.map("n", "gd", vim.lsp.buf.definition)
        mappings.map("n", "gr", vim.lsp.buf.references)
        mappings.map("n", "gi", vim.lsp.buf.implementation)
        -- diagnostics
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
        vim.lsp.config("lua_ls", {})
        -- golang
        vim.lsp.config("gopls", {
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
        })
    end,
}
