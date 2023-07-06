echo "Do you want to install brew? (y/n)"
read install

if [[ $install != "y" ]]; then
  echo "Skipping brew install."
  exit
fi

echo "Installing brew..."

##########

if [[ -e $(which brew) ]]; then
  echo "brew already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file=~/dotfiles/brewfiles/Brewfile

##########

echo "Done installing brew."
