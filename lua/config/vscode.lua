local code = require("vscode")

local k = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { expr = true, noremap = true, silent = true }) -- expr is required
end

local function toggle_sidebar()
	code.call("workbench.action.toggleSidebarVisibility")
end

local function refactor()
	code.with_insert(function()
		code.action("editor.action.refactor")
	end)
end

local function raname_symbol()
	code.with_insert(function()
		code.action("editor.action.rename")
	end)
end

local function tab_prev()
	code.call("workbench.action.previousEditorInGroup")
end

local function tab_next()
	code.call("workbench.action.nextEditorInGroup")
end

k({ "n" }, "<leader>e", toggle_sidebar)
k({ "n", "x" }, "<leader>r", refactor)
k({ "n", "x" }, "<leader>rn", raname_symbol)
k({ "n" }, "L", tab_next)
k({ "n" }, "H", tab_prev)
