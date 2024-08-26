return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "elixir",
        "go",
        "heex",
        "javascript",
        "lua",
        "query",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
