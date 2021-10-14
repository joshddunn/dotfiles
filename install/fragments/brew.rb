class Brew
  def self.install
    if `which brew`.empty?
      puts 'Installing Brew.'
      system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
      puts 'Done installing Brew.'
    else
      puts 'Brew already installed.'
    end

    system('brew bundle --file=~/dotfiles/brewfiles/Brewfile')
  end
end
