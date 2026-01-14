return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = { modified = '[+]', readonly = '   ' },
          },
        },
        lualine_x = {
          'diagnostics',
          {
            function()
              return 'TS'
            end,
            color = function()
              local buf = vim.api.nvim_get_current_buf()
              local active = vim.treesitter.highlighter.active[buf]
              return { fg = active and '#98be65' or '#5c6370' }
            end,
          },
          'filetype',
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
    })
  end,
}
