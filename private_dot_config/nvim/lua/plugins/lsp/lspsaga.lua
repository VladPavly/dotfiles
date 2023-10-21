return {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local saga = require('lspsaga')

    saga.setup({
      scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
      definition = {
        edit = '<CR>',
      },
      ui = {
        code_action = '' -- '󰌶'
      }
    })
  end
}

