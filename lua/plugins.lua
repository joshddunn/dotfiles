local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
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

    -- colorscheme
    use 'chriskempson/base16-vim'

    -- must be in this order
    use 'othree/yajs.vim'
    use 'mxw/vim-jsx'
    use 'ruanyl/vim-gh-line'

    -- personal plugins
    use 'tpope/vim-rails'
    use 'joshddunn/vim-glob'

    -- autocompletion
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'OmniSharp/omnisharp-vim'
  end
)
