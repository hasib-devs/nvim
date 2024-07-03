return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local opts = {
			plugins = { spelling = true },
			-- q = { "<cmd>confirm q<CR>", "Quit" },
			defaults = {
				mode = { "n", "v" },
				prefix = "<leader>",
			},
		}

		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
