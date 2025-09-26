return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require "bufferline"

    bufferline.setup {
      options = {
        themable = false,
        numbers = "none",
        indicator = { style = "none" },
        modified_icon = "[+]",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        separator_style = {},
        enforce_regular_tabs = true,
        always_show_bufferline = false,
      },
    }
  end,
}
