local colors = require("colors")

return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.minimal,
        show_buffer_close_icons = false,
        indicator = { style = "none" },
        separator_style = { '', '' }
      },
      highlights = {
        background = {
          bg = colors.gray6,
          fg = colors.orange
        },
        fill = {
          bg = colors.gray6,
          fg = colors.gray6
        },
        buffer_visible = {
          bg = colors.gray6,
          fg = colors.orange
        },
        buffer_selected = {
          bg = colors.gray5,
          fg = colors.gray1,
          bold = false
        },
        modified = {
          bg = colors.gray6
        },
        modified_visible = {
          bg = colors.gray6
        },
        modified_selected = {
          bg = colors.gray5
        },
        indicator_selected = {
          bg = colors.gray5
        },
        indicator_visible = {
          bg = colors.gray6
        },
        duplicate_selected = {
          bg = colors.gray5,
          fg = colors.gray1,
          bold = false
        },
        duplicate_visible = {
          bg = colors.gray6,
          fg = colors.orange
        },
        duplicate = {
          bg = colors.gray6,
          fg = colors.orange
        }
      }
    })
  end
}
