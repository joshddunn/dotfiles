require("use")({
  "airblade/vim-gitgutter",
  "ap/vim-css-color",
  "arecarn/vim-fold-cycle",
  { "edkolev/tmuxline.vim", init = function()
    vim.g.tmuxline_powerline_separators = 0
    vim.g.tmuxline_separators = {
      left =      "",
      left_alt =  "❯",
      right =     "",
      right_alt = "❮",
      space =     " "
    }
  end },
  "fnune/base16-vim",
  "github/copilot.vim",
  "joom/vim-commentary",
  "junegunn/vim-easy-align",
  "justinmk/vim-sneak",
  "lukas-reineke/indent-blankline.nvim",
  "maxbrunsfeld/vim-yankstack",
  "pseewald/vim-anyfold",
  "puremourning/vimspector",
  "ruanyl/vim-gh-line",
  "tpope/vim-abolish",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  { "vim-airline/vim-airline", dependencies = "vim-airline/vim-airline-themes", init = function()
    vim.g["airline#extensions#tabline#enabled"] = 1
    vim.g.airline_theme = "base16_tomorrow"
  end},
  { "kyazdani42/nvim-tree.lua", dependencies = "kyazdani42/nvim-web-devicons" },
  { "neoclide/coc.nvim", branch = "release" },
  { "nvim-telescope/telescope.nvim", tag = '0.1.2', dependencies = "nvim-lua/plenary.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})
