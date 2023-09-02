return {
  "pseewald/vim-anyfold",
  init = function()
    vim.api.nvim_command("autocmd BufRead * AnyFoldActivate")
  end
}
