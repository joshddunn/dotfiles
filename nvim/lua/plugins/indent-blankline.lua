return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent", { fg = colors.gray5 })
    end)

    require("ibl").setup({
      indent = {
        highlight = "IndentBlanklineIndent",
        smart_indent_cap = true,
      },
      whitespace = {
        remove_blankline_trail = true
      },
      scope = {
        show_start = false,
        show_end = false,
      }
    })
  end
}
