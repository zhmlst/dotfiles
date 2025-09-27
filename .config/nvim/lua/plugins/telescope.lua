local keys = require "config.keys"

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require "telescope"

    telescope.setup {
      pickers = {
        find_files = { hidden = true },
      },
    }

    keys.map("n", "<leader>/", ":Telescope live_grep<cr>")
  end,
}
