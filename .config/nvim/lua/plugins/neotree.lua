local keys = require "config.keys"
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    keys.map("n", "<leader>e", ":Neotree toggle<cr>")
    require("neo-tree").setup {
      log_level = "error",
      popup_border_style = "",
      filesystem = {
        window = {
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
              },
            },
          },
        },
      },
    }
  end,
}
