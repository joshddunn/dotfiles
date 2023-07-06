# My dotfiles

This configuration is made to be used on mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/dotfiles ~/dotfiles

### Mac

If you are on Mac, install with

    cd ~/dotfiles/install
    sh install.sh

Restart your system (required for installed fonts).

Import `~/dotfiles/iterm2/default.json` as an iTerm2 profile.

Then start using nvim (after `:CheckHealth` passes) and install nvim plugins with `:PackerInstall`.

### Raspberry Pi

If you are using a Raspberry Pi, install with

    cd ~/dotfiles/raspberrypi
    sudo bash install.sh
