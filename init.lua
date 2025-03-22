vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
-- Add semicolon to end of the line
map({ "n", "v" }, "<leader>;", "A;<Esc>", { desc = "Add semicolon to the end" })
-- Add comma to end of the line
map({ "n", "v" }, "<leader>,", "A,<Esc>", { desc = "Add comma to the end" })
-- Save
-- map({ "n", "v" }, "<leader>w", "<cmd> w <cr>", { desc = "Save" })

if vim.g.vscode then
	require("config.vscode")
else
	vim.api.nvim_set_hl(0, "BufferLineError", { fg = "#FF6C6B" }) -- Error: Red
	vim.api.nvim_set_hl(0, "BufferLineWarning", { fg = "#ECBE7B" }) -- Warning: Yellow
	vim.api.nvim_set_hl(0, "BufferLineHint", { fg = "#98be65" }) -- Hint: Green
	vim.api.nvim_set_hl(0, "BufferLineInfo", { fg = "#51afef" }) -- Info: Blue

	require("config.options")
	require("config.keymaps")
	require("config.lazy")
end
