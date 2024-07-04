vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map({ "n", "v" }, "<leader>w", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>")

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])

map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)

map({ "n", "v" }, "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
map({ "n", "v" }, "<S-l>", "<cmd>BufferLineCycleNext<cr>")
map({ "n", "v" }, "<leader>br", "<Cmd>BufferLineCloseRight<CR>")
map({ "n", "v" }, "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>")
map({ "n", "v" }, "<leader>bo", "<Cmd>BufferLineCloseOther<CR>")
map({ "n", "v" }, "<leader>bp", "<Cmd>BufferLineTogglePin<CR>")
map({ "n", "v" }, "<leader>bb", "<Cmd>BufferLinePick<CR>")
