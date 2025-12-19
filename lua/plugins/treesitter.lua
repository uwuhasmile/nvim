return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter') 
    ts.install({ 'lua', 'c', 'cpp', 'cmake', 'make', 'ninja' })
  end
}
