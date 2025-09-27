return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      level = "info",
      timeout = 3000,
      stages = "fade",
      top_down = false,
      max_width = 50,
    }
    vim.notify = require "notify"
  end,
}
