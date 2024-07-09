local o = vim.opt

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.number = true
o.relativenumber = true
o.smartindent = true
o.clipboard = "unnamedplus" -- Use system clipboard
o.cursorline = true
o.termguicolors = true
o.list = true -- enable the below listchars
o.listchars = { tab = "▸ ", trail = "·" }
o.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer
o.completeopt = "menuone,longest,preview"
o.undofile = true -- persistent undo
o.backup = true -- automatically save a backup file
o.backupdir:remove(".") -- keep backups out of the current directory
o.wrap = false
o.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
-- o.scrolloff = 999
-- o.sidescrolloff = 8
o.confirm = true -- ask for confirmation instead of erroring
o.signcolumn = "yes"
o.ignorecase = true
o.smartcase = true
o.laststatus = 3

o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitright = true
o.splitbelow = true -- When on, splitting a window will put the new window below the current one
