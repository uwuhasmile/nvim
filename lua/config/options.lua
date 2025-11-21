vim.o.number = true
vim.o.signcolumn = 'auto'
vim.o.cursorline = true

vim.o.wrap = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.enc = 'utf-8'
vim.o.fenc = 'utf-8'

vim.o.clipboard = 'unnamedplus'

vim.o.swapfile = false

vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.hlsearch = true
vim.o.list = true
vim.o.listchars = 'tab:·┈,trail:·,multispace:·'

vim.diagnostic.config({
  virtual_text = true,
  underline = true
})
