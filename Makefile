install:
	brew bundle

	grep -q -F 'source ~/dotfiles/zshrc' ~/.zshrc || echo 'source ~/dotfiles/zshrc' >> ~/.zshrc
	grep -q -F 'source ~/dotfiles/zshrc.work' ~/.zshrc || echo 'source ~/dotfiles/zshrc.work' >> ~/.zshrc
	grep -q -F 'source-file ~/dotfiles/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/tmux.conf' >> ~/.tmux.conf

	git config --global init.templatedir '~/dotfiles/git-templates'
	git config --global alias.unadd "reset HEAD"
	git config --global pager.diff false

	ln -sf ~/dotfiles/sshrc.d ~/.sshrc.d
	ln -sf ~/dotfiles/sshrc ~/.sshrc
	ln -sf ~/dotfiles/asdfrc ~/.asdfrc
	ln -sf ~/dotfiles/tool-versions ~/.tool-versions
	ln -sf ~/dotfiles/tmuxinator ~/.config/tmuxinator
	ln -sf ~/dotfiles/scimrc ~/.scimrc
	ln -sf ~/dotfiles/lua ~/.config/nvim/lua
	ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua

	asdf plugin list | grep 'ruby' || asdf plugin add ruby
	asdf plugin list | grep 'nodejs' || asdf plugin add nodejs
	asdf plugin list | grep 'python' || asdf plugin add python
	asdf plugin list | grep 'lua' || asdf plugin add lua
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

	([ -d "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions) || echo "zsh-autosuggestions already exists"
	([ -d "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting) || echo "zsh-syntax-highlighting already exists"
	([ -d "~/.oh-my-zsh/custom/plugins/zsh-completions" ] && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions) || echo "zsh-completions already exists"
	([ -d "~/.oh-my-zsh/custom/plugins/z.lua" ] && git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua) || echo "z.lua already exists"
	([ -d "~/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)") || echo "oh-my-zsh already exists"
