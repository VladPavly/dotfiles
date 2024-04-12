return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- Move to prev result
            ['<C-j>'] = actions.move_selection_next, -- Move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- Send selected to quickfixlist
          },
        },
      }
    })

    telescope.load_extension('fzf')
  end
}
