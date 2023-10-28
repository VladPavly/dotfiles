local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "

require('lazy').setup({
    {import = 'plugins'},
    {import = 'plugins.lsp'},
    {import = 'plugins.dap'},
})
require('core')

-- require("main.plugins-setup")
-- require("main.core.options")
-- require("main.core.keymaps")
-- require("main.core.colorscheme")

-- require("main.plugins.comment")
-- require("main.plugins.nvim-tree")
-- require("main.plugins.lualine")
-- require("main.plugins.telescope")
-- require("main.plugins.nvim-cmp")
-- require("main.plugins.treesitter")
-- require("main.plugins.alpha")

-- require("main.plugins.lsp.mason")
-- require("main.plugins.lsp.lspsaga")
-- require("main.plugins.lsp.lspconfig")

-- require("main.plugins.dap.mason-nvim-dap")
-- require("main.plugins.dap.nvim-dap-ui")

-- require("main.plugins.autopairs")
-- require("main.plugins.gitsigns")

