-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert or visual mode
keymap.set("i", "kj", "<ESC>")
-- Select all (then yank, or delete)
keymap.set("n", "<C-v>", "ggVG")

-- horizontal movements
keymap.set({ "n", "v" }, "<C-e>", "$") -- Move to end
keymap.set({ "n", "v" }, "<C-b>", "_") -- Move to beginning

-- save with <C-s> and reset to normal mode
keymap.set({ "n", "i" }, "<C-s>", "<cmd> w <CR><ESC>")

-- close file with <C-q>
keymap.set("n", "<C-q>", "<cmd> q <CR>")

-- find with "<C-f>"
keymap.set("n", "<C-f>", "/")

-- vertical movements and keep it vertically centered
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "j", "jzz")
keymap.set("n", "k", "kzz")
keymap.set("n", "<C-g>", "Gzz") -- center end of file

-- disable arrow keys
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")

keymap.set("i", "<Left>", "<Nop>")
keymap.set("i", "<Right>", "<Nop>")
keymap.set("i", "<Down>", "<Nop>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<C-9>", "<C-a>") -- increment
keymap.set("n", "<C-8>", "<C-x>") -- decrement

-- flip boolean
keymap.set("n", "<leader>fb", ":ToggleBool<CR>")

-- range sort
keymap.set("v", "<leader>rs", ":'<,'> sort<CR>") -- sort lines
keymap.set("v", "<leader>rsd", ":'<,'> sort u<CR>") -- sort & remove duplicates

-- open link in chrome
keymap.set("n", "<leader>gl", [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]])

-- Move left/right buffers/tabs
keymap.set("n", "H", ":bprev<CR>") -- go to left tab
keymap.set("n", "L", ":bnext<CR>") -- go to right tab
keymap.set("n", "Q", "<cmd>Bdelete!<CR>") -- close current buffer without closing window

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Close current buffer
keymap.set("n", "<leader>q", "<cmd>bd!<CR>", { desc = "Force close current buffer" })

-- Save file with CMD + S
keymap.set({ "n", "i", "v" }, "<D-s>", ":w<CR>", { desc = "Save file", silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "-", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>cs", function()
	require("nvim-tree.api").tree.collapse_all()
end, { noremap = true, silent = true, desc = "Collapse sidebar" })

-- jester
keymap.set("n", "<leader>j", ":lua require'jester'.run()<CR>") -- nearest test
keymap.set("n", "<leader>ju", ":lua require'jester'.run({cmd = \"yarn jest -t -u '$result' $file\",})<CR>") -- update snapshot nearest test

keymap.set("n", "<leader>jd", ":lua require'jester'.debug()<CR>") -- debug nearest test
keymap.set("n", "<leader>jf", ":lua require'jester'.run_file()<CR>") -- whole file
keymap.set("n", "<leader>jw", ":lua require'jester'.run_last()<CR>") -- last test

-- trouble
keymap.set("n", "<C-t>", ":Trouble<CR>") -- open trouble

-- jumpwire
keymap.set("n", "<leader>ji", "<cmd>:lua require('jumpwire').jump('implementation')<CR>")
keymap.set("n", "<leader>jt", "<cmd>:lua require('jumpwire').jump('test')<CR>")
keymap.set("n", "<leader>jsn", "<cmd>:lua require('jumpwire').jump('snap')<CR>")
keymap.set("n", "<leader>jst", "<cmd>:lua require('jumpwire').jump('stories')<CR>")
keymap.set("n", "<leader>jh", "<cmd>:lua require('jumpwire').jump('helpers')<CR>")

-- fzf-lua
keymap.set("n", "<C-p>", "<cmd>FzfLua files resume=true<cr>") -- find files with resume
keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep resume=true<cr>") -- live grep with resume
keymap.set("n", "<leader>fc", "<cmd>FzfLua grep_cword resume=true<cr>") -- grep word under cursor with resume
keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>") -- list open buffers
keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<cr>") -- resume last search

-- fzf-lua git commands
keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>") -- list all git commits
keymap.set("n", "<leader>gfc", "<cmd>FzfLua git_bcommits<cr>") -- list git commits for current file
keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>") -- list git branches
keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<cr>") -- list current changes with diff preview

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- whichkey
keymap.set("n", "<leader>wk", ":WhichKey<CR>") -- mapping to restart lsp if necessary

-- open storybook
keymap.set("n", "<leader>sb", ":!open 'http://localhost:6006'<CR>")

-- open localhost:3000
keymap.set("n", "<leader>yd", ":!open 'http://localhost:3000'<CR>")
