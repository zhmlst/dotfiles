return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install({
      "lua",
      "go",
      "rust",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.bo[bufnr].filetype

        local lang = vim.treesitter.language.get_lang(ft)
        if lang then
          pcall(vim.treesitter.start, bufnr, lang)
        end
      end,
    })
  end,
}
