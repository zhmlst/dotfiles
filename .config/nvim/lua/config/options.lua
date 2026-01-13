vim.diagnostic.config({
  virtual_text = {
    spacing = 0,
    source = "if_many",
    prefix = "//",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.confirm = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "•",
  nbsp = "␣",
  extends = "→",
  precedes = "←",
}
vim.opt.inccommand = "split"
vim.opt.mouse = ""
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.cursorline = true
vim.opt.completeopt = "menu,menuone,noselect"
