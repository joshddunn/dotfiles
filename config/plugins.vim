if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'dag/vim-fish'
Plug 'itchyny/lightline.vim'
Plug 'jamshedvesuna/vim-markdown-preview'
Plug 'jlanzarotta/bufexplorer'
Plug 'joom/vim-commentary'
Plug 'justinj/vim-pico8-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-node'
Plug 'pseewald/vim-anyfold'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'arecarn/vim-fold-cycle'

" must be in this order
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'

" a fork of 'tpope/vim-rails'
Plug 'joshddunn/vim-rails'

Plug 'joshddunn/vim-rsync'
Plug 'joshddunn/vim-quick-command'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'fishbullet/deoplete-ruby'
Plug 'wokalski/autocomplete-flow'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'

call plug#end()
