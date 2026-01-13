return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = {
      preset = "none",
      ["<C-f>"] = { "select_and_accept" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Tab>"] = { "fallback" },
      ["<S-Tab>"] = { "fallback" },
      ["<CR>"] = { "fallback" },
    },

    completion = {
      ghost_text = { enabled = true },
    },
  },
}
