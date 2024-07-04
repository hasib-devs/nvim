return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				indicator = {
					-- style = "underline",
				},
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				-- separator_style = "slope",
				themable = false,
				truncate_names = false,
			},
		})
	end,
}
