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
	local code = require("vscode")
	--
	local k = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { expr = true }) -- expr is required
	end

	local function toggle_sidebar()
		code.call("workbench.action.toggleSidebarVisibility")
	end

	k({ "n" }, "<leader>e", toggle_sidebar)
else
	require("config.options")
	require("config.keymaps")
	require("config.lazy")
end
