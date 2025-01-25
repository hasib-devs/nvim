return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 40,
			open_mapping = [[<c-t>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = false,
			direction = "float",
			close_on_exit = true, -- close the terminal window when the process exits
			shell = nil, -- change the default shell
			float_opts = {
				border = "rounded",
				winblend = 0,
			},
			winbar = {
				enabled = true,
				name_formatter = function(term) --  term: Terminal
					return term.count
				end,
			},
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>lg",
			"<cmd>lua _LAZYGIT_TOGGLE()<CR>",
			{ noremap = true, silent = true, desc = "Lazygit" }
		)
	end,
}
