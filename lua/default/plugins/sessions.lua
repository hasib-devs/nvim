-- local function restore_nvim_tree()
-- 	local nvim_tree = require("nvim-tree")
-- 	nvim_tree.change_dir(vim.fn.getcwd())
-- 	nvim_tree.refresh()
-- end

return {
	"rmagatti/auto-session",
	-- dependencies = {
	-- 	"nvim-telescope/telescope.nvim",
	-- },
	config = function()
		require("auto-session").setup({
			auto_session_suppress_dirs = {
				"/Users/wedevs/Desktop/testing",
				"/Users/wedevs/Desktop/projects",
			},
			auto_clean_after_session_restore = false,
			pre_save_cmds = { "Neotree close" },
			post_restore_cmds = { "Neotree source=filesystem reveal=true reveal_force_cwd=true action=show" },
			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
				buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
			},
			-- auto_session_use_git_branch = true,
			vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
				desc = "Search session",
			}),
		})
	end,
}
