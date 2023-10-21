return {
  'neovim/nvim-lspconfig',
  config = function()
    local keymap = vim.keymap
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local lspconfig = require('lspconfig')

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- Show definition, references
      keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- Got to declaration
      keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- See definition and make edits in window
      keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Go to implementation
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- See available code actions
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Smart rename
      keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show  diagnostics for line
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show diagnostics for cursor
      keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Jump to previous diagnostic in buffer
      keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Jump to next diagnostic in buffer
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- Show documentation for what is under cursor
      keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- See outline on right hand side
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- LSPs
    local servers = {
      'pyright',
      'ruff_lsp',
      'clangd'
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  end
}

