return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim'
  },
  config = function()
    mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
      ensure_installed = {
        'pyright',
        'ruff_lsp',
        'clangd'
      },
      automatic_installation = true,
    })
  end
}
