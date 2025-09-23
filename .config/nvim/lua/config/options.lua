local options = {
  --fmt
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  --file
  confirm = true,
  undofile = true,
  swapfile = false,
  backup = false,
  writebackup = false,
  --ui
  wrap = false,
  inccommand = "split",
  cursorline = true,
  laststatus = 3,
  splitkeep = "screen",
  signcolumn = "yes",
  showmode = false,
  termguicolors = true,
  list = true,
  listchars = {
    tab = "» ",
    trail = "•",
    conceal = "┊",
    nbsp = "␣",
  },
  --behavior
  mouse = "",
  scrolloff = 10,
  updatetime = 250,
  smartcase = true,
  ignorecase = true,
  clipboard = "unnamedplus",
  completeopt = "menu,menuone,noselect",
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
