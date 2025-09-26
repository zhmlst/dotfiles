return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      level = "info",

      timeout = 3000,

      stages = "fade_in_slide_out", -- "fade_in_slide_out", "slide", "fade", "static"

      top_down = false,
      max_width = 50,
    }

    vim.notify = require "notify"
  end,
}
