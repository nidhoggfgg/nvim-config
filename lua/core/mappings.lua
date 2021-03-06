local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- leader
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 在窗口间移动
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- same as vscode
map("n", "<C-s>", ":w<CR>", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- the c-n is used for tree
map("n", "<A-n>", ":nohl<CR>", opts)