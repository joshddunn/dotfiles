class Asdf
  def self.install
    system('brew bundle --file=~/dotfiles/brewfiles/Brewfile.asdf')

    Utils.append('~/.zshrc', "\. #{`brew --prefix asdf`.chomp}/libexec/asdf.sh")

    list = `asdf plugin list`.split("\n")

    plugins = Utils.readlines('~/dotfiles/asdf/tool-versions').map do |line|
      split_line = line.split(' ')
      [split_line.shift, split_line.join(' ')]
    end.to_h

    TTY::Prompt.new.multi_select('What plugins do you want to install?', plugins.keys).each do |plugin|
      system("asdf plugin add #{plugin}") unless list.include? plugin
      `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring` if plugin == 'nodejs'
      system("asdf install #{plugin} #{plugins[plugin]}")
      system("asdf global #{plugin} #{plugins[plugin]}")
    end
  end
end
