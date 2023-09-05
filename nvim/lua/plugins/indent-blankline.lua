local colors = require("colors")

return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent", {
      fg = colors.gray5,
      nocombine = true
    })

    require("indent_blankline").setup {
      char_highlight_list = { "IndentBlanklineIndent" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    }
  end
}
