echo "Do you want to setup dotfiles? (y/n)"
read configure

if [[ $configure != "y" ]]; then
  echo "Skipping dotfiles setup."
  exit
fi

echo "Setting up dotfiles..."

##########

touch ~/dotfiles/nvim/lua/work.lua

cmd="source ~/dotfiles/zshrc"
if [[ -z $(rg "$cmd" ~/.zshrc) ]]; then
  echo $cmd >> ~/.zshrc
fi

cmd="source-file ~/dotfiles/tmux.conf"
if [[ -z $(rg "$cmd" ~/.tmux.conf) ]]; then
  echo $cmd >> ~/.tmux.conf
fi

cp -i ~/dotfiles/jmux.yaml ~/.jmux.yaml

mkdir ~/.config/nvim

ln -si ~/dotfiles/asdf/asdfrc ~/.asdfrc
ln -si ~/dotfiles/asdf/default-gems ~/.default-gems
ln -si ~/dotfiles/asdf/default-npm-packages ~/.default-npm-packages
ln -si ~/dotfiles/asdf/default-python-packages ~/.default-python-packages
ln -si ~/dotfiles/asdf/tool-versions ~/.tool-versions
ln -si ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -si ~/dotfiles/nvim/lua ~/.config/nvim/
ln -si ~/dotfiles/glow.yml ~/Library/Preferences/glow/glow.yml
ln -si ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

##########

echo "Done setting up dotfiles."
