#!/bin/bash

# install brew stuff
brew bundle

# iterm2 colors
git clone https://github.com/chriskempson/base16-iterm2 ~/base16-iterm2

# dotfiles
grep -q -F 'source ~/.config/nvim/zshrc' ~/.zshrc || echo 'source ~/.config/nvim/zshrc' >> ~/.zshrc
grep -q -F 'source-file ~/.config/nvim/tmux.conf' ~/.tmux.conf || echo 'source-file ~/.config/nvim/tmux.conf' >> ~/.tmux.conf

# setup git hooks
ln -s .git-templates ~/.git-templates
git config --global init.templatedir '~/.git-templates'

chmod +x ~/.config/nvim/.git-templates/hooks/pre-commit
chmod +x ~/.config/nvim/.git-templates/hooks/pre-push

# touch files
touch ~/.config/nvim/config/work.vim

change shell
grep -q -F '/usr/local/bin/zsh' /etc/shells || echo '/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh

# oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
