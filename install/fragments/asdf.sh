echo "Do you want to install asdf? (y/n)"
read install

if [[ $install != "y" ]]; then
  echo "Skipping asdf install."
  exit
fi

echo "Installing asdf..."

##########

brew bundle --file=~/dotfiles/brewfiles/Brewfile.asdf

cmd=". $(brew --prefix asdf)/libexec/asdf.sh"
if [[ -z $(rg "$cmd" ~/.zshrc) ]]; then
  echo $cmd >> ~/.zshrc
fi

for language in $(cat ~/dotfiles/asdf/tool-versions); do
  if [[ $language =~ ^[a-z]+$ ]]; then
    asdf plugin add $language
  fi
done

asdf install

##########

echo "Done installing asdf."
