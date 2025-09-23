local keys = require "config.keys"
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  require("telescope").setup {
    keys.map("n", "<leader>/", ":Telescope live_grep<cr>"),
    pickers = { find_files = { hidden = true } },
  },
}
