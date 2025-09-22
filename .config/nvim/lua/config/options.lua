local options = {
  --fmt
  --autoindent = true, smartindent = true
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  --file
  confirm = true,
  undofile = true,
  swapfile = false,
  backup = false,
  writebackup = false,
  --ui
  cursorlineopt = "number",
  number = true,
  numberwidth = 2,
  ruler = false,
  cursorline = true,
  laststatus = 3,
  splitkeep = "screen",
  signcolumn = "yes",
  showmode = false,
  termguicolors = true,
  breakindent = false,
  showbreak = "↪ ",
  list = true,
  listchars = {
    tab = "» ",
    trail = "•",
    conceal = "┊",
    nbsp = "␣",
  },
  --behavior
  mouse = "",
  updatetime = 250,
  smartcase = true,
  ignorecase = true,
  clipboard = "unnamedplus",
  completeopt = "menu,menuone,noselect",
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
