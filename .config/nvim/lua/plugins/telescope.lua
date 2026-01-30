vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
}
