vim.g.vim_json_warnings = 0
return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'lua-language-server',
        'stylua',
        'gopls',
        'gofumpt',
        'goimports-reviser',
        'buf',
        'sqls',
        'sql-formatter',
        'yaml-language-server',
        'taplo',
        'bash-language-server',
        'shfmt',
        'prettier',
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              workspace = { checkThirdParty = false },
            },
          },
        },
        gopls = {},
        bufls = {},
        sqls = {},
        yamlls = {},
        taplo = {},
        bashls = {},
      }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<cr>', opts)
        end,
      })

      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports-reviser', 'gofumpt' },
        proto = { 'buf' },
        sql = { 'sql_formatter' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        toml = { 'taplo' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
