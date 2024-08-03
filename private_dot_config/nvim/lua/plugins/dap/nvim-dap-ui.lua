return {
  'rcarriga/nvim-dap-ui',
  dependencies = 'nvim-neotest/nvim-nio',
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    dapui.setup()

    vim.cmd("colorscheme catppuccin-macchiato");
  end,
  keys = {
    { '<leader>db', '<cmd>DapToggleBreakpoint <CR>', desc = 'Add breakpoint' },
    { '<leader>dr', '<cmd>DapContinue <CR>', desc = 'Start debugger' }
  }
}
