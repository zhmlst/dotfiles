vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  extends = '→',
  precedes = '←',
  nbsp = '␣',
}

vim.cmd.colorscheme('retrobox')

vim.api.nvim_set_hl(0, 'SnippetTabstop', { link = 'None' })
vim.api.nvim_set_hl(0, 'SnippetPlaceholder', { link = 'None' })

if not vim.pack then
  return
end

for _, plugin in ipairs({
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}) do
  vim.g['loaded_' .. plugin] = 1
end

vim.pack.add({ { src = 'https://github.com/williamboman/mason.nvim' } })
require('mason').setup()

vim.pack.add({ { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' } })
require('mason-tool-installer').setup({
  ensure_installed = {
    'clangd',
    'stylua',
    'shfmt',
    'tree-sitter-cli',
    'gopls',
    'buf',
    'goimports',
    'lua-language-server',
    'rust-analyzer',
  },
  auto_update = true,
  run_on_start = true,
})

vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter' } })
require('nvim-treesitter').install({ 'c', 'go', 'rust' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'rust' },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.pack.add({ { src = 'https://github.com/saghen/blink.cmp' } })
require('blink.cmp').setup({
  fuzzy = { implementation = 'lua' },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
    },
  },
})

vim.pack.add({ { src = 'https://github.com/stevearc/conform.nvim' } })
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'goimports', 'gofmt' },
    rust = { 'rustfmt' },
    proto = { 'buf' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    ['_'] = { 'trim_whitespace' },
  },
  format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
})

vim.pack.add({ { src = 'https://github.com/neovim/nvim-lspconfig' } })
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true), checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--function-arg-placeholders=0',
    '--header-insertion=never',
  },
  init_options = {
    fallbackFlags = { '-xc', '-std=c11', '-D_POSIX_C_SOURCE=200112L' },
  },
})

vim.lsp.config('rust-analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
})

vim.lsp.enable({ 'lua_ls', 'clangd', 'gopls', 'rust-analyzer' })
