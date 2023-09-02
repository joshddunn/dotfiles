return {
  "tpope/vim-abolish",
  init = function()
    vim.keymap.set("i", "_", "<C-]>_")
    vim.keymap.set("i", "-", "<C-]>-")

    vim.g.abolish_save_file = os.getenv("HOME") .. "/dotfiles/lua/after/abolish.vim"
  end
}
