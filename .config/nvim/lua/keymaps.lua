-- ===========================
-- Keymaps Configuration
-- ===========================

-- Shorthand for creating keymaps
local keymap = vim.keymap.set
local s = { silent = true }

-- Set <Space> as the leader key
vim.g.mapleader = " "

-- ─────────────────────────────────────────────
-- Navigation Enhancements
-- ─────────────────────────────────────────────
-- Keep cursor centered when scrolling with Ctrl-d/u
keymap("n", "<C-d>", "<C-d>zz", s)
keymap("n", "<C-u>", "<C-u>zz", s)

-- ─────────────────────────────────────────────
-- File & Tab Management
-- ─────────────────────────────────────────────
keymap("n", "<leader>n", "<cmd>tabnew<CR>", s) -- Open new tab
keymap("n", "<leader>|", "<cmd>vsplit<CR>", s) -- Vertical split
keymap("n", "<leader>-", "<cmd>split<CR>", s) -- Horizontal split

-- ─────────────────────────────────────────────
-- Editing & Clipboard
-- ─────────────────────────────────────────────
keymap("v", "<leader>p", '"_dP', s) -- Paste without overwriting register
keymap("x", "y", [["+y]], s) -- Yank to system clipboard
keymap("t", "<Esc>", "<C-\\><C-N>", s) -- Escape terminal mode

-- ─────────────────────────────────────────────
-- LSP Integrations
-- ─────────────────────────────────────────────
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", s) -- Go to definition

keymap("n", "K", vim.lsp.buf.hover, opts) -- Show documentation
keymap("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
keymap("n", "gr", vim.lsp.buf.references, opts) -- List references
keymap("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions

-- ─────────────────────────────────────────────
-- Keymaps for Core Plugins
-- ─────────────────────────────────────────────
keymap("n", "<leader>f", ":Pick files<CR>", { desc = "Find files" })
keymap("n", "<leader>lg", ":Pick grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>h", ":Pick help<CR>", { desc = "Help tags" })
keymap("n", "<leader>b", ":Pick buffers<CR>", { desc = "Show current buffers" })
keymap("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file manager" })

-- ─────────────────────────────────────────────
-- File Operations
-- ─────────────────────────────────────────────
keymap("n", "<leader>o", ":update<CR>:source<CR>", s) -- Save & reload config
keymap("n", "<leader>w", ":write<CR>", s) -- Save file
keymap("n", "<leader>q", ":quit<CR>", s) -- Quit

-- ─────────────────────────────────────────────
-- Plugin Management (Neovim's vim.pack)
-- ─────────────────────────────────────────────
keymap("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", s) -- Update all plugins

-- ─────────────────────────────────────────────
-- Formatting (Conform.nvim)
-- ─────────────────────────────────────────────
keymap("n", "<leader>fm", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
	})
end, { desc = "Format file with Conform", silent = true })
