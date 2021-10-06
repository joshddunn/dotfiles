class Asdf
  def self.install
    system("brew bundle --file=~/dotfiles/brewfiles/Brewfile.asdf")

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
  end
end