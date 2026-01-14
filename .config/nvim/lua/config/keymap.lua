vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'x', 's', 'o' }, 'Q', '<cmd>q<cr>')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 'c' }, '<C-q>', '<cmd>qa<cr>')
vim.keymap.set({ 'n', 'i', 'x', 's', 'o', 'c' }, '<C-s>', '<cmd>w<cr>')

for _, p in ipairs({ 'g', 'z', '[', ']' }) do
  vim.keymap.set('n', p .. 'Q', '<cmd>q<cr>')
  vim.keymap.set('n', p .. '<C-q>', '<cmd>qa<cr>')
  vim.keymap.set('n', p .. '<C-s>', '<cmd>w<cr>')
end

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set({ 'i', 'c' }, '<C-a>', '<Home>')
vim.keymap.set({ 'i', 'c' }, '<C-e>', '<End>')
vim.keymap.set({ 'i', 'c' }, '<C-b>', '<Left>')
vim.keymap.set({ 'i', 'c' }, '<C-f>', '<Right>')
vim.keymap.set('i', '<C-k>', '<C-o>D')
vim.keymap.set('c', '<C-k>', [[<C-\>egetcmdline()[:getcmdpos()-2]<cr>]])

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('x', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('x', 'K', ":m '<-2<cr>gv=gv")
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')
