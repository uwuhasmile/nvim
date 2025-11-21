return {
  'saghen/blink.cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets'
  },
  version = '1.*',

  config = function()
    require('blink.cmp').setup()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,

  opts = {
    keymap = { present = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        }
      },
      menu = {
        draw = {
          treesitter = { 'lsp' },
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      }
    },

    signature = { enabled = true }
  }
}
