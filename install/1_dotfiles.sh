touch ~/.hushlogin
touch ~/dotfiles/nvim/lua/secret.lua

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

mkdir -p ~/Library/Application\ Support/Rectangle
cp -i ~/dotfiles/templates/rectangle.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json
cp -i ~/dotfiles/templates/mux.json ~/.mux.json
cp -i ~/dotfiles/git/gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim

ln -si ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -si ~/dotfiles/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -si ~/dotfiles/nvim/lua ~/.config/nvim/
