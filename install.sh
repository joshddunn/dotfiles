#!/bin/bash

# install brew stuff
brew bundle

# touch files
touch ~/.config/nvim/config/work.vim
touch ~/.config/nvim/config/zshrc.work

# iterm2 colors
git clone https://github.com/chriskempson/base16-iterm2 ~/base16-iterm2

# dotfiles
grep -q -F 'source ~/.config/nvim/zshrc' ~/.zshrc || echo 'source ~/.config/nvim/zshrc' >> ~/.zshrc
grep -q -F 'source ~/.config/nvim/zshrc.work' ~/.zshrc || echo 'source ~/.config/nvim/zshrc.work' >> ~/.zshrc
grep -q -F 'source-file ~/.config/nvim/tmux.conf' ~/.tmux.conf || echo 'source-file ~/.config/nvim/tmux.conf' >> ~/.tmux.conf

# setup git hooks
git config --global init.templatedir '~/.config/nvim/git-templates'
git config --global alias.unadd "reset HEAD"
git config --global pager.diff false

chmod +x ~/.config/nvim/git-templates/hooks/pre-commit
chmod +x ~/.config/nvim/git-templates/hooks/pre-push

# symlink files
ln -s ~/.config/nvim/sshrc.d ~/.sshrc.d
ln -s ~/.config/nvim/sshrc ~/.sshrc

# change shell
grep -q -F '/usr/local/bin/zsh' /etc/shells || echo '/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh

gem install -u tmuxinator
ln -s ~/.config/nvim/tmuxinator ~/.config/tmuxinator

# asdf
ln -s ~/.config/nvim/asdfrc ~/.asdfrc
ln -s ~/.config/nvim/tool-versions ~/.tool-versions

asdf plugin add ruby
asdf plugin add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install

# ruby gems
gem install tmuxinator

# oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
