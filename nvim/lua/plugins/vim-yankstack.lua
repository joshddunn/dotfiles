return {
  "maxbrunsfeld/vim-yankstack",
  init = function()
    vim.keymap.set("n", "c-p", "<Plug>yankstack_substitute_older_paste")
    vim.keymap.set("n", "c-P", "<Plug>yankstack_substitute_newer_paste")
  end
}
