local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

M.map("n", "<leader>q", ":copen<cr>")

-- Buffers
M.map("n", "<Tab>", ":bn<cr>")
M.map("n", "<S-Tab>", ":bp<cr>")

-- Window movement
M.map("n", "<C-h>", "<c-w>h")
M.map("n", "<C-j>", "<c-w>j")
M.map("n", "<C-k>", "<c-w>k")
M.map("n", "<C-l>", "<c-w>l")

-- Insert mode escape
M.map("i", "<C-c>", "<Esc>")

-- Normal mode commands
M.map("n", "<C-c>", ":nohl<cr>")
M.map("n", "<C-q>", ":q<cr>")
M.map("n", "<leader>w", ":w<cr>")
M.map("n", "<leader>u", ":e<cr>")

-- Visual mode mappings
M.map("v", "J", ":m '>+1<CR>gv=gv")
M.map("v", "K", ":m '<-2<CR>gv=gv")

-- Scrolling and searching
M.map("n", "<C-d>", "<C-d>zz")
M.map("n", "<C-u>", "<C-u>zz")
M.map("n", "n", "nzzzv")
M.map("n", "N", "Nzzzv")

-- Macros
M.map("n", ",e", "oif err != nil {<cr>}<Esc>Oreturn err<Esc>")
M.map("n", ",m", "yiw}ifunc(<Esc>pa) foo() {}<Esc>T(;ylphvua <Esc>WWcw")

return M
