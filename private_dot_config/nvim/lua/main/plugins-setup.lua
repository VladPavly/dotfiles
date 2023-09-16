-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- Lua functions that many plugins use

  -- Colorschemes
  use("Mofiqul/dracula.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })

  use("christoomey/vim-tmux-navigator") -- Tmux & split window navigation

  use("szw/vim-maximizer") -- Maximizes and restores current window

  -- Essential plugins
  use("tpope/vim-surround") -- Add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- Replace with register contents using motion (gr + motion)
  use("wakatime/vim-wakatime") -- Wakatime integration

  -- Commenting with gc
  use("numToStr/Comment.nvim")

  -- File explorer
  use("nvim-tree/nvim-tree.lua")

  -- VS Code like icons
  use("nvim-tree/nvim-web-devicons")

  -- Statusline
  use("nvim-lualine/lualine.nvim")

  -- Startup
  use('goolord/alpha-nvim')

  -- Fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- Fuzzy finder

  -- Autocompletion
  use("hrsh7th/nvim-cmp") -- Completion plugin
  use("hrsh7th/cmp-buffer") -- Source for text in buffer
  use("hrsh7th/cmp-path") -- Source for file system paths

  -- Snippets
  use("L3MON4D3/LuaSnip") -- Snippet engine
  use("saadparwaiz1/cmp_luasnip") -- For autocompletion
  use("rafamadriz/friendly-snippets") -- Useful snippets

  -- Managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  
  -- Tabs
  use('romgrk/barbar.nvim')

  -- Configuring lsp servers
  use("neovim/nvim-lspconfig") -- Easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- For autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  use("onsails/lspkind.nvim") -- VS Code like icons for autocompletion
  
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- Auto brackets
  use("windwp/nvim-autopairs")

  -- Git
  use("lewis6991/gitsigns.nvim") -- Show line modifications on left hand side

  if packer_bootstrap then
    require("packer").sync()
  end
end)
