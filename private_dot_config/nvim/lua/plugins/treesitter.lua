return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()

    local treesitter = require('nvim-treesitter')
    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        'json',
        'python',
        'cpp',
        'javascript',
        'typescript',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'bash',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
      },
      auto_install = true,
    })
  end, 
}
