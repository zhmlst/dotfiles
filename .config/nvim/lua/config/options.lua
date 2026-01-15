vim.diagnostic.config({
  virtual_text = {
    spacing = 0,
    source = 'if_many',
    prefix = '//',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = 'always',
  },
})

vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 50
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.mouse = ''

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.inccommand = 'split'
vim.opt.laststatus = 3
vim.opt.splitkeep = 'screen'
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '•',
  nbsp = '␣',
  extends = '…',
  precedes = '…',
}
