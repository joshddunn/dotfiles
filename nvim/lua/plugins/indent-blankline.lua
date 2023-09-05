local colors = require("colors")

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.cmd("highlight IndentBlanklineIndent guifg=" .. colors.gray5 .. " gui=nocombine")

    require("indent_blankline").setup {
      char_highlight_list = { "IndentBlanklineIndent" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    }
  end
}
