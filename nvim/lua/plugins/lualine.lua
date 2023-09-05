local colors = require("colors")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local b = { bg = colors.gray5, fg = colors.gray1 }
    local c = { bg = colors.gray6, fg = colors.orange }

    local tomorrow_night = {
      normal = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      },
      visual = {
        a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      },
      command = {
        a = { bg = colors.cyan, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      },
      inactive = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = b, c = c, x = b
      }
    }

    require('lualine').setup({
      options = {
        theme = tomorrow_night,
        component_separators = { left = '>', right = '<'},
        section_separators = { left = '', right = ''},
      },
      sections = {
        -- can do something like this
        -- local function x()
        --   return 'some information here'
        -- end
        --
        -- lualine_x = { x }
        lualine_x = {}
      }
    })
  end
}
