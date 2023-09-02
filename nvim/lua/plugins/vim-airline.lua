return {
  "vim-airline/vim-airline",
  dependencies = "vim-airline/vim-airline-themes",
  init = function()
    vim.g["airline#extensions#tabline#enabled"] = 1
    vim.g.airline_theme = "base16_tomorrow"
  end
}
