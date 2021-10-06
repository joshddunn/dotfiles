class Nvim
  def self.install
    system("pip2 install --upgrade pip")
    system("pip3 install --upgrade pip")

    system("gem install -u tmuxinator")
    system("npm install -g neovim")
    system("pip2 install --user pynvim")
    system("pip3 install --user pynvim")
    system("gem install -u neovim")
  end
end
