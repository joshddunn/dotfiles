local colors = require("colors")

return {
  "pseewald/vim-anyfold",
  init = function()
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "*",
      command = "AnyFoldActivate"
    })

    vim.api.nvim_set_hl(0, "Folded", { bg = colors.gray6, fg = colors.gray2 })
  end
}
