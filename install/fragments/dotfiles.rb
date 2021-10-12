class Dotfiles
  def self.install
    touch("~/dotfiles/nvim/lua/work.lua")
    touch("~/dotfiles/zshrc.work")

    append("~/.zshrc", "source ~/dotfiles/zshrc")
    append("~/.zshrc", "source ~/dotfiles/zshrc.work")
    append("~/.tmux.conf", "source-file ~/dotfiles/tmux.conf")

    mkdir("~/.config/nvim")

    {
      "~/dotfiles/asdfrc" => "~/.asdfrc",
      "~/dotfiles/tool-versions" => "~/.tool-versions",
      "~/dotfiles/tmuxinator" => "~/.config/tmuxinator",
      "~/dotfiles/nvim/init.lua" => "~/.config/nvim/init.lua",
      "~/dotfiles/nvim/lua" => "~/.config/nvim/lua"
    }.each { |source, destination| symlink(source, destination) }
  end

  private

  def self.append(filename, string)
    return if File.readlines(File.expand_path(filename)).grep(Regexp.new(string)).any?
    File.open(File.expand_path(filename), "a") do |file|
      file.puts string
    end
  end

  def self.touch(filename)
    File.write(File.expand_path(filename), "")
  end

  def self.symlink(source, destination)
    File.symlink(File.expand_path(source), File.expand_path(destination)) unless exists?(destination)
  end

  def self.mkdir(directory)
    Dir.mkdir(File.expand_path(directory)) unless exists?(directory)
  end

  def self.exists?(dir)
    path = File.expand_path(dir)
    if File.exist?(path) || File.symlink?(path)
      p "#{dir} already exists"
      true
    else
      false
    end
  end
end
