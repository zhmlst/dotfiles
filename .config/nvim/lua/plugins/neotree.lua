local keys = require "config.keys"
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup {
      popup_border_style = "",
      keys.map("n", "<leader>e", ":Neotree toggle<cr>"),
      keys.map("n", "<leader>b", ":Neotree buffers toggle<cr>"),
      filesystem = {
        window = {
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
      buffers = {
        window = {
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
      git_status = {
        window = {
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
    }
  end,
}
