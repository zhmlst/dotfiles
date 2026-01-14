return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>' },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      mappings = {
        ['h'] = 'close_node',
        ['l'] = 'open',
        [','] = 'navigate_up',
      },
    },
  },
}
