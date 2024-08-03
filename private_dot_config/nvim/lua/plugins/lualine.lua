return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lualine = require('lualine')
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        -- theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          }
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' }
      },
    })
  end
}
