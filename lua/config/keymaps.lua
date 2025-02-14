local o = vim.opt
local map = vim.keymap.set

-- Save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>", { desc = "Save" })
map({ "i" }, "jk", "<Esc><cmd> w <cr>", { desc = "Save" })

-- Quit
map("n", "<leader>Q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- Exit insert mode
map("i", "jj", "<ESC>", { desc = "Exit Insert Mode" })

-- Tmux Navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Navigate Down" })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Navigate Up" })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Navigate Right" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "o", "r" }) -- Stop continuing comments on new lines
	end,
})
