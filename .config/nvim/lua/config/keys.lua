local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

--insert
M.map("i", "<C-c>", "<Esc>")
M.map("i", "<C-d>", "<Del>")
M.map("i", "<C-a>", "<Home>")
M.map("i", "<C-e>", "<End>")
M.map("i", "<C-f>", "<Right>")
M.map("i", "<C-b>", "<Left>")
--core
M.map({ "n", "i", "v" }, "<F1>", "<nop>")
M.map({ "n", "i", "v" }, "<F1>", "<nop>")
M.map("n", "<C-c>", ":nohl<cr>")
M.map("n", "<C-q>", ":q<cr>")
M.map("n", "<leader>w", ":w<cr>")
M.map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })
-- visual
M.map("x", "<leader>n", [[:<C-u>'<,'>g/^\s*\/\//d | '<,'>s/\s*\/\/.*/ /e | nohl<cr>]])
--buffers
M.map("n", "<Tab>", ":bn<cr>")
M.map("n", "<S-Tab>", ":bp<cr>")
M.map("n", "<leader>q", ":bd<cr>")
--movement
M.map("n", "<C-h>", "<c-w>h")
M.map("n", "<C-j>", "<c-w>j")
M.map("n", "<C-k>", "<c-w>k")
M.map("n", "<C-l>", "<c-w>l")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "l", "<cr>", { noremap = true, silent = true, buffer = true })
  end,
})

return M
