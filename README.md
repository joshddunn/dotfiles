# My nvim Configuration

This configuration is made to be used on mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/nvim ~/.config/nvim

Then run

    cd ~/.config/nvim
    brew bundle

Then start using nvim (after `:CheckHealth` passes). The first time you use nvim the plugins will be installed.

You will also have to create `rsync.vim` and `work.vim` files in the `config/` directory.

## Install Notes

Base16 iTerm2 colors

    https://github.com/chriskempson/base16-iterm2

### vim-coffee-script

Need to globally install coffee script using npm for syntastic support

    npm install -g coffee-script
