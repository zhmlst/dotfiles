vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>af", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("autoformat on save: " .. (vim.g.disable_autoformat and "off" or "on"))
end)

vim.keymap.set("i", "<c-c>", "<esc>")
vim.keymap.set({ "n", "i", "v" }, "<c-q>", "<cmd>qa<cr>")
vim.keymap.set({ "n", "i", "v" }, "<c-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>")
vim.keymap.set({ "n", "v" }, ",", '""')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
