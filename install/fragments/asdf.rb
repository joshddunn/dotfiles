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

    append("~/.zshrc", `echo \"\n. $(brew --prefix asdf)/libexec/asdf.sh\"`)

    system("asdf install")
  end

  def self.append(filename, string)
    return if File.readlines(File.expand_path(filename)).grep(Regexp.new(string)).any?
    File.open(File.expand_path(filename), "a") do |file|
      file.puts string
    end
  end
end
