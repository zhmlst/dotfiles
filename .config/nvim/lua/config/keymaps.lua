local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

map("i", "<C-c>", "<Esc>")
map("n", "<C-c>", ":nohl<cr>")
map("i", "<C-с>", "<Esc>") -- ru
map("n", "<C-с>", ":nohl<cr>") -- ru
map("n", "<C-q>", ":q<cr>")
map("n", "<leader>w", ":w<cr>")
map("n", "<leader>u", ":e<cr>")
-- buffers
map("n", ",d", ":bd<cr>")
map("n", ",f", ":bn<cr>")
map("n", ",b", ":bp<cr>")
-- movement
map("n", "<C-h>", "<c-w>h")
map("n", "<C-j>", "<c-w>j")
map("n", "<C-k>", "<c-w>k")
map("n", "<C-l>", "<c-w>l")
