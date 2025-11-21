return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({
      ensure_installed = { 'lua', 'c', 'cpp', 'cmake', 'glsl', 'hlsl', 'json', 'json5', 'make' },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
