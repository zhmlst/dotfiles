local options = {
  clipboard = "unnamedplus",
  confirm = true,
  breakindent = false,
  showbreak = "↪ ",
  undofile = true,
  showmode = false,
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  list = true,
  listchars = {
    tab = "» ",
    trail = "•",
    conceal = "┊",
    nbsp = "␣",
  },
  termguicolors = true,
  cindent = true,
  mouse = "",
  signcolumn = "yes",
  updatetime = 250,
  swapfile = false,
  backup = false,
  writebackup = false,
  completeopt = "menu,menuone,noselect",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
