return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "tsx", "elixir", "heex", "yaml", "terraform", "astro", "css" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
