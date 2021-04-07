system "brew bundle"

system "grep -q -F 'source ~/dotfiles/zshrc' ~/.zshrc || echo 'source ~/dotfiles/zshrc' >> ~/.zshrc"
system "grep -q -F 'source ~/dotfiles/zshrc.work' ~/.zshrc || echo 'source ~/dotfiles/zshrc.work' >> ~/.zshrc"
system "grep -q -F 'source-file ~/dotfiles/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/tmux.conf' >> ~/.tmux.conf"

system "git config --global init.templatedir '~/dotfiles/git-templates'"
system "git config --global alias.unadd 'reset HEAD'"
system "git config --global pager.diff false"

files = {
  "~/dotfiles/sshrc" => "~/.sshrc",
  "~/dotfiles/asdfrc" => "~/.asdfrc",
  "~/dotfiles/tool-versions" => "~/.tool-versions",
  "~/dotfiles/tmuxinator" => "~/.config/tmuxinator",
  "~/dotfiles/init.lua" => "~/.config/nvim/init.lua",
  "~/dotfiles/lua" => "~/.config/nvim/lua",
  "~/dotfiles/sshrc.d" => "~/.sshrc.d",
}

def dir_exists?(dir)
  File.exist?(File.expand_path(dir))
end

files.each do |source, destination|
  if dir_exists?(destination)
    puts "#{destination} already exists"
  else
    `ln -s #{source} #{destination}`
  end
end

list = `asdf plugin list`.split("\n")

%w[
  ruby
  nodejs
  python
  lua
].each do |plugin|
  `asdf plugin add #{plugin}` unless list.include? plugin
end

`bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring`

`asdf install`

`pip2 install --upgrade pip`
`pip3 install --upgrade pip`

`gem install -u tmuxinator`
`npm install -g neovim`
`pip install --user pynvim`
`pip3 install --user pynvim`
`gem install -u neovim`

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")
	`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" )
	`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-completions")
	`git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions`
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/z.lua")
	`git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua`
end

unless dir_exists?("~/.oh-my-zsh")
  `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
end
