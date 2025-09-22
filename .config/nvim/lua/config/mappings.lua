local function map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

--buffers
map("n", "<leader>1", ":b 1<cr>")
map("n", "<leader>2", ":b 2<cr>")
map("n", "<leader>d", ":bd<cr>")
--movement
map("n", "<C-h>", "<c-w>h")
map("n", "<C-j>", "<c-w>j")
map("n", "<C-k>", "<c-w>k")
map("n", "<C-l>", "<c-w>l")
--QoL
map("i", "<C-c>", "<Esc>")
map("n", "<C-c>", ":nohl<cr>")
-- shortcuts
map("n", "<C-q>", ":q<cr>")
map("n", "<leader>w", ":w<cr>")
map("n", "<leader>u", ":e<cr>")
