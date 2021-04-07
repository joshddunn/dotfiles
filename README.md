# My dotfiles

This configuration is made to be used on mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/dotfiles ~/dotfiles

Then run

    cd ~/dotfiles
    ruby install.rb

Import `~/dotfiles/iterm2/default.json` as an iTerm2 profile.

Then start using nvim (after `:CheckHealth` passes). The first time you use nvim the plugins will be installed.

### Notes

For performance, delete everything in your `~/.zshrc` file except the source to `zshrc` and `zshrc.work`.
