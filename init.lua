local o = vim.opt
local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add semicolon to end of the line
map({ "n", "v" }, "<leader>;", "A;<Esc>", { desc = "Add semicolon to the end" })
-- Add comma to end of the line
map({ "n", "v" }, "<leader>,", "A,<Esc>", { desc = "Add comma to the end" })

-- Save
map({ "n", "v" }, "<leader>w", "<cmd> w <cr>", { desc = "Save" })

if vim.g.vscode then
	-- local code = require('vscode')
	--
	-- local k = function(mode, lhs, rhs)
	--   vim.keymap.set(mode, lhs, rhs, { expr = true }) -- expr is required
	-- end
else
	-- Save
	map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>", { desc = "Save" })
	map({ "i" }, "jk", "<Esc><cmd> w <cr>", { desc = "Save" })

	-- Quit
	map("n", "<leader>Q", "<cmd>q<cr>", { desc = "Quit" })
	map("n", "<leader>q", "<cmd>bd<cr>", { desc = "Delete buffer" })

	-- Exit insert mode
	map("i", "jj", "<ESC>", { desc = "Exit Insert Mode" })

	-- Tmux Navigation
	-- map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
	-- map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Navigate Down" })
	-- map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Navigate Up" })
	-- map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Navigate Right" })

	o.number = true
	o.relativenumber = true
	o.expandtab = true
	o.shiftwidth = 4
	o.tabstop = 4
	o.softtabstop = 4
	o.cursorline = true
	o.undofile = true -- Save undo history
	o.confirm = true
	o.wildmenu = true
	o.wildmode = "longest:full,full"

	-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
	o.ignorecase = true
	o.smartcase = true

	o.syntax = "on"
	o.autoindent = true
	o.encoding = "UTF-8"
	o.mouse = "a"
	o.title = true
	o.splitright = true
	o.splitbelow = true
	o.path:append("**")
	o.hidden = true
	o.signcolumn = "yes" -- Keep signcolumn on by default

	-- Decrease update time
	-- o.updatetime = 250

	-- Decrease mapped sequence wait time
	-- o.timeoutlen = 300
	-- Don't show the mode, since it's already in the status line
	o.showmode = false

	-- Sets how neovim will display certain whitespace characters in the editor.
	--  See `:help 'list'`
	--  and `:help 'listchars'`
	o.list = true
	o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

	-- Preview substitutions live, as you type!
	o.inccommand = "split"

	-- Clear highlights on search when pressing <Esc> in normal mode
	--  See `:help hlsearch`
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
	-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
	-- is not what someone will guess without a bit more experience.
	--
	-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
	-- or just use <C-\><C-n> to exit terminal mode
	vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	-- Sync clipboard between OS and Neovim.
	vim.schedule(function()
		o.clipboard = "unnamedplus"
	end)

	-- Highlight when yanking (copying) text
	--  Try it with `yap` in normal mode
	--  See `:help vim.highlight.on_yank()`
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	require("config.lazy")
end
