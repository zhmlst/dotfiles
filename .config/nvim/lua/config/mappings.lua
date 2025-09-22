local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

-- buffers
M.map("n", "<leader>1", ":b 1<cr>")
M.map("n", "<leader>2", ":b 2<cr>")
M.map("n", "<leader>d", ":bd<cr>")
-- movement
M.map("n", "<C-h>", "<c-w>h")
M.map("n", "<C-j>", "<c-w>j")
M.map("n", "<C-k>", "<c-w>k")
M.map("n", "<C-l>", "<c-w>l")
-- QoL
M.map("i", "<C-c>", "<Esc>")
M.map("n", "<C-c>", ":nohl<cr>")
-- shortcuts
M.map("n", "<C-q>", ":q<cr>")
M.map("n", "<leader>w", ":w<cr>")
M.map("n", "<leader>u", ":e<cr>")

return M
