return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local colors = {
      black        = "#1d1f21",
      blue         = "#81a2be",
      cyan         = "#8abeb7",
      darkgray     = "#292a2e",
      gray         = "#373b41",
      green        = "#b5bd68",
      magenta      = "#b294bb",
      orange       = "#de935f",
      red          = "#cc6666",
      white        = "#e0e0e0",
      yellow       = "#f0c674",
    }

    local b = { bg = colors.gray, fg = colors.white }
    local c = { bg = colors.darkgray, fg = colors.orange }

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
      }
    })
  end
}
