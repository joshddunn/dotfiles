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
Plug 'kchmck/vim-coffee-script'
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
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'

" colorscheme
function FixupBase16(info)
    !sed -i '/Base16hi/\! s/a:\(attr\|guisp\)/l:\1/g' ~/.vim/plugged/base16-vim/colors/*.vim
endfunction
Plug 'chriskempson/base16-vim', { 'do': function('FixupBase16') }

" must be in this order
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'ruanyl/vim-gh-line'

" personal plugins
Plug 'tpope/vim-rails'
Plug 'joshddunn/vim-glob'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " slow
Plug 'wokalski/autocomplete-flow'

call plug#end()
