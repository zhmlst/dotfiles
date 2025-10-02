local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

--core
M.map({ "n", "i", "v" }, "<F1>", "<nop>")
M.map("n", ";", ":<C-f>")
M.map("i", "<C-c>", "<Esc>")
M.map("n", "<C-c>", ":nohl<cr>")
M.map("n", "<C-q>", ":q<cr>")
M.map("n", "<leader>w", ":w<cr>")
M.map("n", "<leader>u", "<cmd>e<cr><cmd>LspRestart<cr>")
--buffers
M.map("n", "<Tab>", ":bn<cr>")
M.map("n", "<S-Tab>", ":bp<cr>")
M.map("n", "<leader>q", ":bd<cr>")
--movement
M.map("n", "<C-h>", "<c-w>h")
M.map("n", "<C-j>", "<c-w>j")
M.map("n", "<C-k>", "<c-w>k")
M.map("n", "<C-l>", "<c-w>l")

return M
