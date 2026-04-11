-- ===========================
-- Plugin Configuration
-- ===========================

local pack = vim.pack

-- ─────────────────────────────────────────────
-- Git Integration
-- ─────────────────────────────────────────────
pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
	signcolumn = false, -- disable separate sign column, uses number column
})

-- ─────────────────────────────────────────────
-- Core Utility Plugins
-- ─────────────────────────────────────────────
pack.add({
	{ src = "https://github.com/nvim-mini/mini.pick" },          -- Fuzzy finder (lightweight alternative to Telescope)
	{ src = "https://github.com/stevearc/oil.nvim" },            -- File explorer in buffer
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Syntax highlighting and parsing
	{ src = "https://github.com/windwp/nvim-autopairs" },        -- Auto insert matching pairs
})

-- MiniPick (fuzzy finder)
require("mini.pick").setup()

-- Autopairs
require("nvim-autopairs").setup()

-- Treesitter configuration
require("nvim-treesitter").install({ "python", "lua", "bash", "cpp", "yaml" })

-- Oil (file manager)
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	default_file_explorer = true,
})

-- ─────────────────────────────────────────────
-- Completion & Snippets
-- ─────────────────────────────────────────────
pack.add({
	{ src = "https://github.com/saghen/blink.cmp" },
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },

	keymap = {
		preset = "default",
		["<C-space>"] = {},
		["<C-p>"] = {},
		["<Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-s>"] = { "show", "show_documentation" },
		["<C-e>"] = { "hide_documentation", "hide" },
		["<C-y>"] = { "select_and_accept" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = {
		default = { "lsp", "buffer", "snippets", "path" },
	},
})
