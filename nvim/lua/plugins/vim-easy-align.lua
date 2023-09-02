return {
  "junegunn/vim-easy-align",
  init = function()
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("x", "gax", "<Plug>(EasyAlign)<c-x>")
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("n", "gax", "<Plug>(EasyAlign)ip<c-x>")
  end
}
