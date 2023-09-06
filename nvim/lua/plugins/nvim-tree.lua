return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.keymap.set("", "<leader>nn", ":NvimTreeToggle<cr>")
    vim.keymap.set("", "<leader>nf", ":NvimTreeFindFile<cr>")

    require("nvim-tree").setup {
      view = {
        side = "right",
        width = 50
      }
    }
  end
}
