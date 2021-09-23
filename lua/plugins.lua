local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require("packer").startup(
  function()
    use 'ap/vim-css-color'
    use 'jlanzarotta/bufexplorer'
    use 'joom/vim-commentary'
    use 'maxbrunsfeld/vim-yankstack'
    use 'mileszs/ack.vim'
    use 'moll/vim-node'
    use 'pseewald/vim-anyfold' -- slow

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'tpope/vim-abolish'
    use 'tpope/vim-endwise'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'nathanaelkane/vim-indent-guides'
    use 'arecarn/vim-fold-cycle'
    use 'airblade/vim-gitgutter'
    use 'vim-airline/vim-airline' -- slow
    use 'vim-airline/vim-airline-themes'
    use 'edkolev/tmuxline.vim'
    use 'w0rp/ale'
    use 'kien/ctrlp.vim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'jparise/vim-graphql'
    use 'elixir-editors/vim-elixir'
    use 'junegunn/vim-easy-align'
    use 'leafgarland/typescript-vim'
    use 'justinmk/vim-sneak'
    use 'sudar/vim-arduino-syntax'
    use 'vim-crystal/vim-crystal'
    use 'tpope/vim-rails'

    -- colorscheme
    use 'chriskempson/base16-vim'

    -- must be in this order
    use 'othree/yajs.vim'
    use 'mxw/vim-jsx'
    use 'ruanyl/vim-gh-line'

    -- personal plugins
    use 'joshddunn/vim-glob'

    -- autocompletion
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'OmniSharp/omnisharp-vim'
  end
)
