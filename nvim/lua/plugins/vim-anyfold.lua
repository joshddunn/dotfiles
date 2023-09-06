return {
  "pseewald/vim-anyfold",
  init = function()
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "*",
      command = "AnyFoldActivate"
    })
  end
}
