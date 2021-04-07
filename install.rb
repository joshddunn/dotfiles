def dir_exists?(dir)
  if File.exist?(File.expand_path(dir))
    p "#{dir} already exists"
    true
  else
    false
  end
end

system("brew bundle")

unless dir_exists?("~/.oh-my-zsh")
  system("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\" \" \" --unattended --keep-zshrc")
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-autosuggestions")
  system("git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions")
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" )
  system("git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting")
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/zsh-completions")
  system("git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions")
end

unless dir_exists?("~/.oh-my-zsh/custom/plugins/z.lua")
  system("git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua")
end

system("grep -q -F 'source ~/dotfiles/zshrc' ~/.zshrc || echo 'source ~/dotfiles/zshrc' >> ~/.zshrc")
system("grep -q -F 'source ~/dotfiles/zshrc.work' ~/.zshrc || echo 'source ~/dotfiles/zshrc.work' >> ~/.zshrc")
system("grep -q -F 'source-file ~/dotfiles/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/tmux.conf' >> ~/.tmux.conf")

system("git config --global init.templatedir '~/dotfiles/git-templates'")
system("git config --global alias.unadd 'reset HEAD'")
system("git config --global pager.diff false")

files = {
  "~/dotfiles/sshrc" => "~/.sshrc",
  "~/dotfiles/asdfrc" => "~/.asdfrc",
  "~/dotfiles/tool-versions" => "~/.tool-versions",
  "~/dotfiles/tmuxinator" => "~/.config/tmuxinator",
  "~/dotfiles/init.lua" => "~/.config/nvim/init.lua",
  "~/dotfiles/lua" => "~/.config/nvim/lua",
  "~/dotfiles/sshrc.d" => "~/.sshrc.d",
}

files.each do |source, destination|
  system("ln -s #{source} #{destination}") unless dir_exists?(destination)
end

list = `asdf plugin list`.split("\n")

%w[
  ruby
  nodejs
  python
  lua
].each do |plugin|
  system("asdf plugin add #{plugin}") unless list.include? plugin
end

`bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring`

system("asdf install")

system("pip2 install --upgrade pip")
system("pip3 install --upgrade pip")

system("gem install -u tmuxinator")
system("npm install -g neovim")
system("pip install --user pynvim")
system("pip3 install --user pynvim")
system("gem install -u neovim")

puts "All done! Go ahead and restart your terminal."
