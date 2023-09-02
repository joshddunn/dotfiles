return {
  "kyazdani42/nvim-tree.lua",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    vim.keymap.set("", "<leader>nn", ":NvimTreeToggle<cr>")
    vim.keymap.set("", "<leader>nf", ":NvimTreeFindFile<cr>")

    require("nvim-tree").setup {
      view = {
        side = 'right',
        width = 50
      }
    }
  end
}
