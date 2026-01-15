vim.g.vim_json_warnings = 0
return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    dependencies = { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')

      ts.setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })

      local langs = {
        'lua',
        'go',
        'rust',
        'sql',
        'yaml',
        'toml',
        'bash',
        'json',
        'markdown',
      }

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MasonToolsUpdateCompleted',
        callback = function()
          ts.install(langs)
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(
            vim.bo[args.buf].filetype
          ) or vim.bo[args.buf].filetype

          if lang and vim.treesitter.query.get(lang, 'highlights') then
            vim.treesitter.start(args.buf, lang)
            vim.bo[args.buf].indentexpr =
              "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    'saghen/blink.cmp',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'none',
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-m>'] = { 'select_and_accept', 'fallback' },

        ['<C-space>'] = { 'show', 'hide', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },

        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      },

      completion = {
        ghost_text = { enabled = false },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'tree-sitter-cli',
        'lua-language-server',
        'stylua',
        'gopls',
        'gofumpt',
        'goimports',
        'buf',
        'sqls',
        'sql-formatter',
        'yaml-language-server',
        'taplo',
        'bash-language-server',
        'shfmt',
        'prettier',
        'rust-analyzer',
        'rustfmt',
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

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
        rust_analyzer = {},
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
        config.capabilities = capabilities
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
        go = { 'goimports', 'gofumpt' },
        proto = { 'buf' },
        sql = { 'sql_formatter' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        toml = { 'taplo' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        rust = { 'rustfmt' },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    },
  },
}
