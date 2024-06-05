local colors = require("colors")
local lib = require("lib")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local b = { bg = colors.gray5, fg = colors.gray1 }
    local c = { bg = colors.gray6, fg = colors.orange }

    local tomorrow_night = {
      normal = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = b, c = c
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = b, c = c
      },
      visual = {
        a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
        b = b, c = c
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = b, c = c
      },
      command = {
        a = { bg = colors.cyan, fg = colors.black, gui = "bold" },
        b = b, c = c
      },
      inactive = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = b, c = c
      }
    }

    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = tomorrow_night,
        component_separators = { left = "❯", right = "❮"},
        section_separators = { left = "", right = ""},
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { function()
          local status = vim.lsp.status()
          if lib.includes(status, "Initializing") then
            vim.fn.timer_start(100, function()
              lualine.refresh({ place = { "statusline" } })
            end)
          end
          return status
        end }
      }
    })
  end
}
