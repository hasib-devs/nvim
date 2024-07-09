local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	group = vim.api.nvim_create_augroup("center_on_insert", {}),
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd.normal({ bang = true, "zz" })
-- 	end,
-- })

-- Save
map({ "n", "v" }, "<leader>w", "<cmd> w <cr>", { desc = "Save" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>", { desc = "Save" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit" })

-- Exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer" })
map("n", "<leader>r", "<CMD>Neotree focus<CR>", { desc = "Focus File Explorer" })

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>p", "<CMD>split<CR>", { desc = "Horizontal Split" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate Left" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate Right" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate Up" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate Down" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><", { desc = "Resize Left" })
map("n", "<C-Right>", "<C-w>>", { desc = "Resize Right" })
map("n", "<C-Up>", "<C-w>+", { desc = "Resize Up" })
map("n", "<C-Down>", "<C-w>-", { desc = "Resize Down" })

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])

map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
map("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, { desc = "List Workspace Folders" })
-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- hover
map("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover" })

-- Buffer Navigation
map({ "n", "v" }, "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map({ "n", "v" }, "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map({ "n", "v" }, "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close Right Buffer" })
map({ "n", "v" }, "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close Left Buffer" })
map({ "n", "v" }, "<leader>bo", "<Cmd>BufferLineCloseOther<CR>", { desc = "Close Other Buffers" })
map({ "n", "v" }, "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin Buffer" })
map({ "n", "v" }, "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })

-- Scroll to center
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
-- map("n", "n", "nzzzv", { desc = "Next" })
-- map("n", "N", "Nzzzv", { desc = "Previous" })

-- Tmux Navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Navigate Down" })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Navigate Up" })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Navigate Right" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "Comment toggle", remap = true })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
