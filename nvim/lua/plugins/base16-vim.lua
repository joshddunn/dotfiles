return {
  "fnune/base16-vim",
  init = function()
    vim.cmd.colorscheme("base16-tomorrow-night")

    vim.api.nvim_set_hl(0, "Search", {
      ctermfg = "NONE",
      ctermbg = "NONE",
      fg = "NONE",
      bg = "NONE",
      underline = true
    })
  end
}
