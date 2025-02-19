-- Github theme
vim.cmd([[colorscheme gruvbox]])

-- Treesitter
local treesitter_config = require("nvim-treesitter.configs")
local treesitter_install = require("nvim-treesitter.install")
treesitter_install.prefer_git = false
treesitter_config.setup({
    ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "asm", "cmake", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
