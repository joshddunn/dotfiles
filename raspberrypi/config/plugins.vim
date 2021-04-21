if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'jlanzarotta/bufexplorer'
Plug 'joom/vim-commentary'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'pseewald/vim-anyfold' " slow

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'arecarn/vim-fold-cycle'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline' " slow
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', {'commit': '4145f53f3d343c389ff974b1f1a68eeb39fba18b'}
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'justinmk/vim-sneak'
Plug 'sudar/vim-arduino-syntax'

" colorscheme
Plug 'chriskempson/base16-vim'

" must be in this order
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'ruanyl/vim-gh-line'

" personal plugins
Plug 'tpope/vim-rails'
Plug 'joshddunn/vim-glob'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
