return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvim_tree = require('nvim-tree')

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function open_nvim_tree(data)
      local no_name = data.file == '' and vim.bo[data.buf].buftype == ''
      local directory = vim.fn.isdirectory(data.file) == 1

      if not no_name and not directory then
        return
      end

      if directory then
        vim.cmd.cd(data.file)
      end

      require('nvim-tree.api').tree.open()
    end

    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    
    nvim_tree.setup({
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    })
  end,
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>', desc = 'Toggle file explorer' }
  }
}
