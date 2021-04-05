# install brew stuff
brew bundle

# touch files
touch ~/dotfiles/zshrc.work

# dotfiles
grep -q -F 'source ~/dotfiles/zshrc' ~/.zshrc || echo 'source ~/dotfiles/zshrc' >> ~/.zshrc
grep -q -F 'source ~/dotfiles/zshrc.work' ~/.zshrc || echo 'source ~/dotfiles/zshrc.work' >> ~/.zshrc
grep -q -F 'source-file ~/dotfiles/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/tmux.conf' >> ~/.tmux.conf

# setup git hooks
git config --global init.templatedir '~/dotfiles/git-templates'
git config --global alias.unadd "reset HEAD"
git config --global pager.diff false

chmod +x ~/dotfiles/git-templates/hooks/pre-commit
chmod +x ~/dotfiles/git-templates/hooks/pre-push

mkdir ~/.config/nvim/lua

# symlink files
ln -s ~/dotfiles/sshrc.d ~/.sshrc.d
ln -s ~/dotfiles/sshrc ~/.sshrc
ln -s ~/dotfiles/asdfrc ~/.asdfrc
ln -s ~/dotfiles/tool-versions ~/.tool-versions
ln -s ~/dotfiles/tmuxinator ~/.config/tmuxinator
ln -s ~/dotfiles/scimrc ~/.scimrc
ln -s ~/dotfiles/lua ~/.config/nvim/lua
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua

# asdf
asdf plugin add ruby
asdf plugin add python
asdf plugin add nodejs
asdf plugin add lua
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install

pip2 install --upgrade pip
pip3 install --upgrade pip

# tmuxinator
gem install -u tmuxinator

# install neovim providers
npm install -g neovim
pip install --user pynvim
pip3 install --user pynvim
gem install -u neovim

# oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
