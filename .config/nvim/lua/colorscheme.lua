-- ===========================
-- Colorscheme Configuration
-- ===========================

-- Load the colorscheme plugin using vim.pack
-- (This is part of Neovim's new package manager API in v0.10+)
vim.pack.add({
	{
		src = "https://github.com/folke/tokyonight.nvim",
	},
})

require("tokyonight").setup({
	style = "storm", -- or "night", "moon", "day"
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
-- ─────────────────────────────────────────────
-- Set the active colorscheme
-- ─────────────────────────────────────────────
-- Available variants: "tokyonight-night", "tokyonight-storm",
-- "tokyonight-day", "tokyonight-moon"
vim.cmd.colorscheme("tokyonight-moon")
