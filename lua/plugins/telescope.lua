return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local actions = require("telescope.actions")
		local map = vim.keymap.set

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<c-enter>"] = "to_fuzzy_refine" },
				},
				layout_strategy = "bottom_pane",
				sorting_strategy = "ascending", -- Ensures the prompt is on top
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		map("n", "<leader><leader>", builtin.find_files, { desc = "[S]earch [F]iles" })
		map("n", "<leader>fb", builtin.buffers, { desc = "[ ] Find existing buffers" })
		map("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
		map("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("n", "<leader>ft", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("n", "<leader>fo", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

		map("n", "<leader>fs", ":Autosession search<cr>", { desc = "Search Session" })

		-- Slightly advanced example of overriding default behavior and theme
		map("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		map("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		map("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
