echo "Do you want to configure osx? (y/n)"
read configure

if [[ $configure != "y" ]]; then
  echo "Skipping osx configuration."
  exit
fi

echo "Configuring osx..."

##########

defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

##########

echo "Done configuring osx."
