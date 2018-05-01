# My vim configuration.

This configuration is a constant work in progress and is built for mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/nvim ~/.config/nvim

Then run

    cd ~/.config/nvim
    brew bundle

Then start using nvim (after `:CheckHealth` passes). The first time you use nvim the plugins will be installed.

### Deoplete flow

Need to `flow init` in the current project directory so that javascript autocompletion works.

## Plugins
- [/usr/local/opt/fzf](https://github.com//usr/local/opt/fzf)
- [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
- [Shougo/neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets)
- [Shougo/neosnippet](https://github.com/Shougo/neosnippet)
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [ap/vim-css-color](https://github.com/ap/vim-css-color)
- [arecarn/vim-fold-cycle](https://github.com/arecarn/vim-fold-cycle)
- [dag/vim-fish](https://github.com/dag/vim-fish)
- [fishbullet/deoplete-ruby](https://github.com/fishbullet/deoplete-ruby)
- [flazz/vim-colorschemes](https://github.com/flazz/vim-colorschemes)
- [godlygeek/tabular](https://github.com/godlygeek/tabular)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [jamshedvesuna/vim-markdown-preview](https://github.com/jamshedvesuna/vim-markdown-preview)
- [jelera/vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
- [jlanzarotta/bufexplorer](https://github.com/jlanzarotta/bufexplorer)
- [joom/vim-commentary](https://github.com/joom/vim-commentary)
- [joshddunn/vim-rails](https://github.com/joshddunn/vim-rails) (a fork of tpope's [vim-rails](https://github.com/tpope/vim-rails))
- [joshddunn/vim-rsync](https://github.com/joshddunn/vim-rsync)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [justinj/vim-pico8-syntax](https://github.com/justinj/vim-pico8-syntax)
- [kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [maxbrunsfeld/vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)
- [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
- [moll/vim-node](https://github.com/moll/vim-node)
- [morhetz/gruvbox](https://github.com/morhetz/gruvbox)
- [mxw/vim-jsx](https://github.com/mxw/vim-jsx)
- [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
- [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)
- [pseewald/vim-anyfold](https://github.com/pseewald/vim-anyfold)
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
- [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [tpope/vim-abolish](https://github.com/tpope/vim-abolish)
- [tpope/vim-endwise](https://github.com/tpope/vim-endwise)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [wokalski/autocomplete-flow](https://github.com/wokalski/autocomplete-flow)

This configuration allows you to undo changes, even after closing the file.

## Notes

### rsync

Use these commands to edit files on a server locally.

rsync pull

    rsync -avr remote_host:remote_directory local_directory

rsync push

    rsync -avr local_directory remote_host:remote_directory

### vim-coffee-script

Need to globally install coffee script using npm for syntastic support

    npm install -g coffee-script
