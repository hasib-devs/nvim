return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { truncate = 1 },
				sorting_strategy = "ascending",
				file_ignore_patterns = { ".git/", "node_modules/" },
				wrap_results = true,
				layout_config = {
					prompt_position = "top",
					vertical = { width = { padding = 0 } },
					horizontal = { width = { padding = 0 } },
				},
			},
		})
	end,
}
