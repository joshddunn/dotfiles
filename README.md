# My dotfiles

This configuration is made to be used on mac.

## Installation

Installing this configuration is relatively easy. First, clone this repository.

    git clone https://github.com/joshddunn/dotfiles ~/dotfiles

### Mac

If you are on Mac, install with

    cd ~/dotfiles/install
    make install

Restart your system (required for installed fonts).

Import `~/dotfiles/iterm2/default.json` as an iTerm2 profile.

Then start using nvim (after `:CheckHealth` passes) and install nvim plugins with `:PackerInstall`.

After plugins are installed, run the following in nvim to install coc extensions.

    CocInstall coc-tsserver coc-prettier coc-eslint coc-emmet coc-css coc-json coc-elixir coc-yaml

### Raspberry Pi

If you are using a Raspberry Pi, install with

    cd ~/dotfiles/raspberrypi
    sudo bash install.sh
