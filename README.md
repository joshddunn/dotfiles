# My vim configuration.

This configuration is a constant work in progress and is built for mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/nvim ~/.config/nvim

Then start using nvim. The first time you use nvim the plugins will be installed.

### Deoplete flow

Need to `flow init` in the current project directory so that javascript autocompletion works.

## Plugins
- [ack.vim](https://github.com/mileszs/ack.vim)
- [autocomplete-flow](https://github.com/wokalski/autocomplete-flow)
- [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [deoplete](https://github.com/shougo/deoplete.vim)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [syntastic](https://github.com/scrooloose/syntastic)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-abolish](https://github.com/tpope/vim-abolish)
- [vim-anyfold](https://github.com/pseewald/vim-anyfold)
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
- [vim-commentary](https://github.com/joom/vim-commentary)
- [vim-css-color](https://github.com/ap/vim-css-color)
- [vim-endwise](https://github.com/tpope/vim-endwise)
- [vim-fish](https://github.com/dag/vim-fish)
- [vim-fold-cycle](https://github.com/arecarn/vim-fold-cycle)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-jsx](https://github.com/mxw/vim-jsx)
- [vim-markdown-preview](https://github.com/jamshedvesuna/vim-markdown-preview)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-node](https://github.com/moll/vim-node)
- [vim-pico8-syntax](https://github.com/justinj/vim-pico8-syntax)
- [vim-rails](https://github.com/joshddunn/vim-rails) (a fork of tpope's [vim-rails](https://github.com/tpope/vim-rails))
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)

This configuration allows you to undo changes, even after closing the file.

## Notes

### vim-coffee-script

Need to globally install coffee script using npm for syntastic support

    npm install -g coffee-script
