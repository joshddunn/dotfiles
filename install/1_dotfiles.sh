touch ~/dotfiles/nvim/lua/work.lua

cmd="source ~/dotfiles/configs/zshrc"
if [[ -z $(rg "$cmd" ~/.zshrc) ]]; then
  echo $cmd >> ~/.zshrc
fi

cmd="source-file ~/dotfiles/configs/tmux.conf"
if [[ -z $(rg "$cmd" ~/.tmux.conf) ]]; then
  echo $cmd >> ~/.tmux.conf
fi

mkdir -p ~/.config/ghostty
touch ~/.config/ghostty/config
cmd="config-file = ../../dotfiles/configs/ghostty"
if [[ -z $(rg "$cmd" ~/.config/ghostty/config) ]]; then
  echo $cmd >> ~/.config/ghostty/config
fi

cp -i ~/dotfiles/templates/jmux.yaml ~/.jmux.yaml
cp -i ~/dotfiles/templates/gitconfig ~/.gitconfig

cp -i ~/dotfiles/templates/asdf/tool-versions ~/.tool-versions
cp -i ~/dotfiles/templates/asdf/asdfrc ~/.asdfrc
cp -i ~/dotfiles/templates/asdf/default-npm-packages ~/.default-npm-packages

mkdir -p ~/.config/nvim

ln -si ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -si ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -si ~/dotfiles/nvim/lua ~/.config/nvim/
