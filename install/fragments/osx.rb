class Osx
  def self.install
    system('defaults write NSGlobalDomain InitialKeyRepeat -int 15')
    system('defaults write NSGlobalDomain KeyRepeat -int 2')
  end
end
