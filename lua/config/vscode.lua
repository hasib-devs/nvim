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

-- local function focus_sidebar()
-- 	code.action("workbench.action.focusSideBar")
-- end
--
-- local function focus_editor()
-- 	code.action("workbench.action.focusFirstEditorGroup")
-- end

-- local function buffer_list()
-- 	code.call("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
-- end

-- local function prev_buffer()
-- 	code.call("workbench.action.navigateBack")
-- end

-- local function open_file_browser()
-- 	code.call("file-browser.open")
-- end

k({ "n" }, "<leader>e", toggle_sidebar)
k({ "n", "x" }, "<leader>r", refactor)
k({ "n", "x" }, "<leader>rn", raname_symbol)
-- vim.keymap.set("n", "L", "gt", { noremap = true, silent = true, expr = true })
-- k({ "n" }, "<leader>f", buffer_list)
-- k({ "n" }, "H", prev_buffer)
-- k({ "n" }, "<C-h>", focus_sidebar)
-- k({ "n" }, "<C-l>", focus_editor)
