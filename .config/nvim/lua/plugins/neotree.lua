local mappings = require "config.mappings"
return {
  {
    "nvim-neo-tree/neo-tree.nvim",

    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup {
        mappings.map("n", "<leader>e", ":Neotree toggle<cr>"),
        filesystem = {
          window = {
            popup = {
              border = "double",
            },
            mappings = {
              ["l"] = "open",
              ["h"] = "close_node",
            },
          },
        },
      }
    end,
  },
}
