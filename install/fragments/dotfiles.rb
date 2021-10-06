class Dotfiles
  def self.install
    home = Dir.home

    touch("#{home}/dotfiles/nvim/lua/work.lua")
    touch("#{home}/dotfiles/zshrc.work")

    append("#{home}/.zshrc", "source ~/dotfiles/zshrc")
    append("#{home}/.zshrc", "source ~/dotfiles/zshrc.work")
    append("#{home}/.tmux.conf", "source-file ~/dotfiles/tmux.conf")

    mkdir("#{home}/.config/nvim")

    {
      "#{home}/dotfiles/sshrc" => "#{home}/.sshrc",
      "#{home}/dotfiles/asdfrc" => "#{home}/.asdfrc",
      "#{home}/dotfiles/tool-versions" => "#{home}/.tool-versions",
      "#{home}/dotfiles/tmuxinator" => "#{home}/.config/tmuxinator",
      "#{home}/dotfiles/nvim/init.lua" => "#{home}/.config/nvim/init.lua",
      "#{home}/dotfiles/nvim/lua" => "#{home}/.config/nvim/lua",
      "#{home}/dotfiles/sshrc.d" => "#{home}/.sshrc.d",
    }.each { |source, destination| symlink(source, destination) }
  end

  def self.append(filename, string)
    return if File.readlines(filename).grep(Regexp.new(string)
    File.open(filename) do |file|
      file.puts string
    end
  end

  def self.touch(filename)
    File.write(filename, "")
  end

  def symlink(source, destination)
    File.symlink(source, destination) unless dir_exists?(destination)
  end

  def self.mkdir(directory)
    Dir.mkdir(directory) unless dir_exists?(directory)
  end
end
