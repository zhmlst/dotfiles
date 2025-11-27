return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "go",
        "sql",
        "c",
        "dockerfile",
        "make",
        "rust",
        "bash",
        "proto",
        "asm",
        "json",
        "toml",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@class.outer",
            ["it"] = "@class.inner",
            ["ip"] = "@parameter.inner",
            ["ap"] = "@parameter.outer",
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]t"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[t"] = "@class.outer",
          },
        },
      },
    }
  end,
}
