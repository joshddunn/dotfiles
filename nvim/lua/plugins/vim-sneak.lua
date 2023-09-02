return {
  "justinmk/vim-sneak",
  init = function()
    vim.keymap.set("", "f", "<Plug>Sneak_s")
    vim.keymap.set("", "F", "<Plug>Sneak_S")
    vim.g["sneak#s_next"] = 1
  end
}
