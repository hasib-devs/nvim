vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
-- Add semicolon to end of the line
map({ "n", "v" }, "<leader>;", "A;<Esc>", { desc = "Add semicolon to the end" })
-- Add comma to end of the line
map({ "n", "v" }, "<leader>,", "A,<Esc>", { desc = "Add comma to the end" })
-- Save
map({ "n", "v" }, "<leader>w", "<cmd> w <cr>", { desc = "Save" })

if vim.g.vscode then
	require("config.vscode")
else
	require("config.options")
	require("config.keymaps")
	require("config.lazy")
end
