-- Appearance
-------------

-- Editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.showcmd = true

-- Color scheme
vim.opt.termguicolors = true

-- Netrw
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 4
vim.g.netrw_list_hide = "*.obj,*.exe,.git,.idea,.vs,.vscode,^\\.\\=/\\=$"
vim.g.netrw_hide = 1

-- Behaviour
------------

-- Editing
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Clipboard
vim.opt.clipboard:append { "unnamed", "unnamedplus" }

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- Keymaps
----------

-- General
vim.g.mapleader = " "

-- Disabling arrows
vim.keymap.set({ 'n', 'i', 'v', }, "<Up>", "<Nop>", { noremap = true })
vim.keymap.set({ 'n', 'i', 'v', }, "<Right>", "<Nop>", { noremap = true })
vim.keymap.set({ 'n', 'i', 'v', }, "<Down>", "<Nop>", { noremap = true })
vim.keymap.set({ 'n', 'i', 'v', }, "<Left>", "<Nop>", { noremap = true })
-- Disabling Backspace and Delete
vim.keymap.set({ 'n', 'i', 'v', }, "<BS>", "<Nop>", { noremap = true })
vim.keymap.set({ 'n', 'i', 'v', }, "<Del>", "<Nop>", { noremap = true })

-- Navigation
vim.keymap.set('n', "<leader>fe", vim.cmd.Ex)
