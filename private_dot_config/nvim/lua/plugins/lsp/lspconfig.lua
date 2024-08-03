return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} }
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'Show references'
        keymap.set('n', '<leader>lR', '<cmd>Telescope lsp_references<CR>', opts)

        -- opts.desc = 'Go to declaration'
        -- keymap.set('n', '<leader>le', vim.lsp.buf.declaration, opts)

        opts.desc = 'Show definitions'
        keymap.set('n', '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', opts)

        -- opts.desc = 'Show type definitions'
        -- keymap.set('n', '<leader>lD', '<cmd>Telescope lsp_type_definitions<CR>', opts)

        -- opts.desc = 'Show implementations'
        -- keymap.set('n', '<leader>li', '<cmd>Telescope lsp_implementations<CR>', opts)

        opts.desc = 'See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)

        opts.desc = 'Smart rename'
        keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', '<leader>lD', vim.lsp.buf.hover, opts)

        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>ls', ':LspRestart<CR>', opts)

        opts.desc = 'Previous diagnostic'
        keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        opts.desc = 'Next diagnostic'
        keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end,
    })

    -- LSPs
    local servers = {
      'pyright',
      'ruff_lsp',
      'clangd'
    }

    local capabilities = cmp_nvim_lsp.default_capabilities()
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        capabilities = capabilities
      })
    end
  end
}
