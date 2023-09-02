return {
  "edkolev/tmuxline.vim",
  init = function()
    vim.g.tmuxline_powerline_separators = 0
    vim.g.tmuxline_separators = {
      left =      "",
      left_alt =  "❯",
      right =     "",
      right_alt = "❮",
      space =     " "
    }
  end
}
