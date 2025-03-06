require("lazy").setup({
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "rafamadriz/friendly-snippets" },
	{ "L3MON4D3/LuaSnip" },
	{ "mfussenegger/nvim-lint" },
	{ "stevearc/conform.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"goolord/alpha-nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
})

-- OneDark Setup with Custom Colors
require("onedark").setup({
	style = "darker",
	colors = { bg = "#1e222a", fg = "#c8ccd4" },
	highlights = {
		TSKeyword = { fg = "#c678dd", bold = true },
		TSFunction = { fg = "#61afef", bold = true },
		TSVariable = { fg = "#e5c07b" },
	},
})
require("onedark").load()

-- Treesitter for Better Highlighting
require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "lua", "json" },
	highlight = { enable = true },
	indent = { enable = true },
})

-- Pyright LSP
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off", -- Change if needed
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "ruff_format" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

require("lint").linters_by_ft = { python = { "ruff" } }

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- UI Enhancements
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
