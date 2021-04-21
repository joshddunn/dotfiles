apt -y install neovim fzf ripgrep tmux node ruby

pip install --user pynvim
pip3 install --user pynvim

mkdir ~/.config/nvim

ln -s ~/dotfiles/raspberrypi/init.vim ~/.config/nvim/init.vim

touch ~/.tmux.conf

grep -q -F 'source-file ~/dotfiles/raspberrypi/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/raspberrypi/tmux.conf' >> ~/.tmux.conf
