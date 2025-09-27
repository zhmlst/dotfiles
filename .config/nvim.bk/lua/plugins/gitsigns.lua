return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    current_line_blame = true,
    sign_priority = 6,
    update_debounce = 100,
  },
}
