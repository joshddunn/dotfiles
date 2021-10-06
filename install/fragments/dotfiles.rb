class Dotfiles
  def self.install
    system("touch ~/dotfiles/nvim/lua/work.lua")
    system("touch ~/dotfiles/zshrc.work")
    system("grep -q -F 'source ~/dotfiles/zshrc' ~/.zshrc || echo 'source ~/dotfiles/zshrc' >> ~/.zshrc")
    system("grep -q -F 'source ~/dotfiles/zshrc.work' ~/.zshrc || echo 'source ~/dotfiles/zshrc.work' >> ~/.zshrc")
    system("grep -q -F 'source-file ~/dotfiles/tmux.conf' ~/.tmux.conf || echo 'source-file ~/dotfiles/tmux.conf' >> ~/.tmux.conf")

    files = {
      "~/dotfiles/sshrc" => "~/.sshrc",
      "~/dotfiles/asdfrc" => "~/.asdfrc",
      "~/dotfiles/tool-versions" => "~/.tool-versions",
      "~/dotfiles/tmuxinator" => "~/.config/tmuxinator",
      "~/dotfiles/nvim/init.lua" => "~/.config/nvim/init.lua",
      "~/dotfiles/nvim/lua" => "~/.config/nvim/lua",
      "~/dotfiles/sshrc.d" => "~/.sshrc.d",
    }

    files.each do |source, destination|
      system("ln -s #{source} #{destination}") unless dir_exists?(destination)
    end
  end
end
