-- ===========================
-- LSP (Language Server Protocol) Configuration
-- ===========================

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- LSP configuration
	{ src = "https://github.com/stevearc/conform.nvim" }, -- Formatter
})

-- ─────────────────────────────────────────────
-- 🧹 Code Formatting (Conform.nvim)
-- ─────────────────────────────────────────────
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_format" }, -- ruff fixing what it can first and formatting the rest
		c = { "clang-format" },
		cpp = { "clang-format" },
	},
	formatters = {
		ruff_fix = {
			command = "ruff",
			args = {
				"check",
				"--fix",
				"--exit-zero",
				"--stdin-filename",
				"$FILENAME",
				"-"
			},
			stdin = true,
		},
	},
})


-- ─────────────────────────────────────────────
-- Enable selected LSP servers
-- ─────────────────────────────────────────────
vim.lsp.enable({
	"lua_ls", -- Lua language server
	"pyright", -- Python language server
	"ruff",   -- Python linting tool
	"bashls", -- Bash/SH language server
	"clangd", -- C / C++
	"yamlls", -- Yaml Language Server
	"ansiblels", -- Ansible language server
})

-- ─────────────────────────────────────────────
-- Add yaml files as  ansible yamls
-- ─────────────────────────────────────────────

vim.filetype.add({
	pattern = {
		[".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
		[".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
	},
})
