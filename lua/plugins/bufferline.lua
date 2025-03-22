return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			show_buffer_close_icons = false,
			show_close_icon = false,
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
}
