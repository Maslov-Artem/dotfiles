-- ===========================
-- Auto Commands (autocmds)
-- ===========================

-- Shorthand for Neovim API functions
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ─────────────────────────────────────────────
-- Highlight text after yanking (copying)
-- ─────────────────────────────────────────────
-- This helps visually confirm what you've yanked
local highlight_group = augroup("YankHighlight", { clear = true })

autocmd("TextYankPost", {
	pattern = "*",
	group = highlight_group,
	callback = function()
		vim.hl.on_yank({
			timeout = 170, -- duration of highlight in ms
		})
	end,
})

-- ─────────────────────────────────────────────
-- Auto-format on save using Conform.nvim
-- ─────────────────────────────────────────────
-- Automatically formats the buffer right before saving
autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({
			bufnr = args.buf, -- format only the buffer being saved
			async = false, -- run synchronously before write
			lsp_fallback = true, -- use LSP formatter if Conform has none
		})
	end,
})
