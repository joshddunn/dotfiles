local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(
  function()
    use "airblade/vim-gitgutter"
    use "ap/vim-css-color"
    use "arecarn/vim-fold-cycle"
    use "fnune/base16-vim"
    use "edkolev/tmuxline.vim"
    use "elixir-editors/vim-elixir"
    use "jlanzarotta/bufexplorer"
    use "joom/vim-commentary"
    use "joshddunn/vim-glob"
    use "jparise/vim-graphql"
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
    use "junegunn/vim-easy-align"
    use "justinmk/vim-sneak"
    use "leafgarland/typescript-vim"
    use "maxbrunsfeld/vim-yankstack"
    use "maxmellon/vim-jsx-pretty"
    use "moll/vim-node"
    use "nathanaelkane/vim-indent-guides"
    use "pangloss/vim-javascript"
    use "pseewald/vim-anyfold"
    use "ruanyl/vim-gh-line"
    use "sudar/vim-arduino-syntax"
    use "tpope/vim-abolish"
    use "tpope/vim-endwise"
    use "tpope/vim-fugitive"
    use "tpope/vim-rails"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "vim-airline/vim-airline" -- slow
    use "vim-airline/vim-airline-themes"
    use "w0rp/ale"
    use "ellisonleao/glow.nvim"
    use "noahtheduke/vim-just"

    use { "neoclide/coc.nvim", branch = "release" }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require("nvim-tree").setup {
        view = {
          side = 'right',
          width = 50
        }
      } end
    }
  end
)
