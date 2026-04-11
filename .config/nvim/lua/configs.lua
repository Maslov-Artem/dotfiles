-- ===========================
-- ⚙️ Core Neovim Configuration
-- ===========================

-- Short alias for vim options
local o = vim.opt

-- ─────────────────────────────────────────────
-- UI & Appearance
-- ─────────────────────────────────────────────
o.termguicolors = true  -- Enable 24-bit RGB colors
o.guicursor = "i:block" -- Use block cursor in insert mode
o.colorcolumn = "80"    -- Highlight column 80 for line length guide
o.signcolumn = "yes:1"  -- Always show the sign column
o.number = true         -- Show absolute line numbers
o.relativenumber = true -- Show relative line numbers
o.numberwidth = 2       -- Width of line number column
o.cursorline = true     -- Highlight the current line
o.wrap = false          -- Disable line wrapping
o.scrolloff = 12        -- Keep cursor away from top/bottom edges
o.winborder = "rounded" -- Use rounded borders for floating windows

-- ─────────────────────────────────────────────
-- Indentation & Tabs
-- ─────────────────────────────────────────────
o.autoindent = true                                          -- Maintain indentation from previous line
o.tabstop = 4                                                -- Number of spaces a tab counts for
o.softtabstop = 4                                            -- Number of spaces for editing operations
o.shiftwidth = 4                                             -- Spaces per indentation level
o.shiftround = true                                          -- Round indentation to nearest shiftwidth
o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation↲

-- ─────────────────────────────────────────────
-- File & Buffer Handling
-- ─────────────────────────────────────────────
o.swapfile = false                               -- Disable swap files
o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Persistent undo location
o.undofile = true                                -- Enable persistent undo
o.inccommand = "nosplit"                         -- Show incremental substitution preview

-- ─────────────────────────────────────────────
-- Search & Completion
-- ─────────────────────────────────────────────
o.ignorecase = true -- Ignore case when searching
o.smartcase = true  -- Case-sensetive if search contains uppersace
o.incsearch = true  -- Show matches as you type
o.hlsearch = true   -- Highlight all search matches

-- ─────────────────────────────────────────────
-- Clipboard
-- ─────────────────────────────────────────────
o.clipboard = "unnamedplus" -- Use system clipboard for all operations

-- ─────────────────────────────────────────────
-- Diagnostic Settings
-- ─────────────────────────────────────────────
vim.diagnostic.config({
	virtual_text = { source = true }, -- Show inline diagnostics
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN]  = "",
			[vim.diagnostic.severity.INFO]  = "",
			[vim.diagnostic.severity.HINT]  = "󰌵",
		},
	},
	underline = true, -- Underline problematic text
	update_in_insert = false,
	severity_sort = true,

})

-- ─────────────────────────────────────────────
-- Whitespace Visualization
-- ─────────────────────────────────────────────
o.list = true
o.listchars:append({

	tab = "│─", -- Tab indicator
	trail = "·", -- Trailing space
	nbsp = "␣", -- Non-breaking space
	eol = "↲", -- End of line
})

-- ─────────────────────────────────────────────
-- Formatting
-- ─────────────────────────────────────────────
-- Use Conform.nvim for formatting integration
o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- ─────────────────────────────────────────────
-- Fold
-- ─────────────────────────────────────────────
o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use nvim-treesitter for folding
o.foldmethod = "expr"                          -- use expression as fold method
o.foldlevelstart = 99                          -- all folds are open on start
