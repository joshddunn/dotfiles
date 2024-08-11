# My dotfiles

These dotfiles are built for Mac.

## Installation

Run the following commands:

    git clone https://github.com/joshddunn/dotfiles ~/dotfiles
    cd ~/dotfiles/install
    sh install.sh

Restart your system (required for installed fonts).

Import `~/dotfiles/templates/iterm2.json` as an iTerm2 profile.

Then start using nvim (after `:CheckHealth` passes) and install nvim plugins with `:Lazy`.
