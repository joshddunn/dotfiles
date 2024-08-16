# My dotfiles

These dotfiles are built for Mac.

## Installation

Run the following commands:

    git clone https://github.com/joshddunn/dotfiles ~/dotfiles
    cd ~/dotfiles/install
    sh install.sh

Restart your system (required for installed fonts).

Import ITerm2 profile using `~/dotfiles/templates/iterm2.json`.

Import Rectangle settings using `~/dotfiles/templates/rectangle.json`.

Then start using nvim (after `:CheckHealth` passes) and install nvim plugins with `:Lazy`.
