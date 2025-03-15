return {
  "github/copilot.vim",
  init = function()
    -- other keymap api inserts weird characters
    vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept(\"\\<CR>\")",
      { noremap = true, silent = true, expr = true, script = true })
    vim.g.copilot_no_tab_map = true
  end
}
