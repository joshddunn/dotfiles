class Asdf
  def self.install
    system('brew bundle --file=~/dotfiles/brewfiles/Brewfile.asdf')

    Utils.append('~/.zshrc', `echo \"\n. $(brew --prefix asdf)/libexec/asdf.sh\"`)

    list = `asdf plugin list`.split("\n")

    %w[
      ruby
      nodejs
      python
      lua
    ].each do |plugin|
      system("asdf plugin add #{plugin}") unless list.include? plugin
      `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring` if plugin == 'nodejs'
      system("asdf install #{plugin}")
      system("asdf global #{plugin} latest")
    end
  end
end
