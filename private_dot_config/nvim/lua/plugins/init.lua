return {
  'nvim-lua/plenary.nvim', -- Lua functions that many plugins use

  -- Colorschemes
  'Mofiqul/dracula.nvim',
  { 
    'catppuccin/nvim', 
     name = 'catppuccin'
  },

  -- Essential plugins
  'christoomey/vim-tmux-navigator', -- Tmux & split window navigation
  'szw/vim-maximizer', -- Maximizes and restores current window
  'tpope/vim-surround', -- Add, delete, change surroundings (it's awesome)
  'inkarkat/vim-ReplaceWithRegister', -- Replace with register contents using motion (gr + motion)
  'wakatime/vim-wakatime', -- Wakatime integration

  -- Commenting with gc
  'numToStr/Comment.nvim',

  -- VS Code like icons
  'nvim-tree/nvim-web-devicons',

  -- Fuzzy finding w/ telescope
  {
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'make'
  }, -- Dependency for better sorting performance

  -- Autocompletion
  'hrsh7th/nvim-cmp', -- Completion plugin
  'hrsh7th/cmp-buffer', -- Source for text in buffer
  'hrsh7th/cmp-path', -- Source for file system paths

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp'
  }, -- Snippet engine
  'saadparwaiz1/cmp_luasnip', -- For autocompletion
  'rafamadriz/friendly-snippets', -- Useful snippets

  -- Tabs
  'romgrk/barbar.nvim',

  -- Configuring lsp servers
  'onsails/lspkind.nvim', -- VS Code like icons for autocompletion

  -- Debugger
  'mfussenegger/nvim-dap',
  {
    'mfussenegger/nvim-dap-python',
    config = function()
        require('dap-python').setup('/opt/homebrew/bin/python3.11')
    end,
    dependencies = {
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui'
    }
  },
  'theHamsta/nvim-dap-virtual-text',
  
  -- Git
  'lewis6991/gitsigns.nvim',

  -- Terminal
  {
    'akinsho/toggleterm.nvim', 
    version = '*', 
    config = true
  },

  -- RISC-V
  'henry-hsieh/riscv-asm-vim'
}
