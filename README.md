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
