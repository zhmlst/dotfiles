for _, plugin in ipairs({
	"netrwSettings",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}) do
	vim.g["loaded_" .. plugin] = 1
end

vim.pack.add({
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/kvrohit/rasmus.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/saghen/blink.cmp" },
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.cmd("colorscheme rasmus")

require("blink.cmp").setup({
	keymap = { preset = "default" },

	fuzzy = {
		implementation = "lua",
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"shfmt",
		"tree-sitter-cli",
		"gopls",
		"buf",
		"goimports",
		"lua-language-server",
	},
	auto_update = true,
	run_on_start = true,
})

require("nvim-treesitter").install({ "go", "lua" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "lua" },
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")

vim.lsp.config("buf_ls", {})
vim.lsp.enable("buf_ls")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		proto = { "buf" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
})

require("nvim-tree").setup({})
