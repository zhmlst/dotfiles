vim.pack.add({'https://github.com/neovim/nvim-lspconfig'})
vim.lsp.enable('gopls')
vim.opt.autocomplete = true
vim.opt.completeopt = { "menuone", "noselect" }
require('vim._core.ui2').enable({})
