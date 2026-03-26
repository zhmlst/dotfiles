vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.signcolumn = "no"
vim.opt.relativenumber = true

vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    extends = "→",
    precedes = "←",
}

if vim.version().minor < 12 then
	return
end

vim.pack.add({'https://github.com/neovim/nvim-lspconfig'})
vim.opt.autocomplete = true
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      buildFlags = { "-tags=e2e,integration,unit" },
      directoryFilters = { "-node_modules" },
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable('gopls')

vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
require('vim._core.ui2').enable({})
