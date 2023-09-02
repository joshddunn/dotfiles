return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent guifg=#474747 gui=nocombine]]

    require("indent_blankline").setup {
      char_highlight_list = { "IndentBlanklineIndent" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    }
  end
}
