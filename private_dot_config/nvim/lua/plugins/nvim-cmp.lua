return {
  'hrsh7th/cmp-nvim-lsp',
  dependencies = {
    { 'onsails/lspkind.nvim' },
    { 'saadparwaiz1/cmp_luasnip' }
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    require('luasnip.loaders.from_vscode').lazy_load()

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- Show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- Close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, 
        { name = 'luasnip' }, 
        { name = 'buffer' }, 
        { name = 'path' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end
}
