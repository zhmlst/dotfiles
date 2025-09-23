local keys = require "config.keys"
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  require("telescope").setup {
    keys.map("n", "<leader>/", ":Telescope live_grep<cr>"),
    defaults = {
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
        },
        n = {
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {},
    },
    extensions = {},
  },
}
