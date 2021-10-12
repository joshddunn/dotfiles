class Nvim
  def self.install
    pip = `which pip2` ? "pip2" : "pip"

    system("#{pip} install --upgrade pip")
    system("pip3 install --upgrade pip")

    system("#{pip} install --user pynvim")
    system("pip3 install --user pynvim")

    system("gem install -u neovim")
    system("gem install -u tmuxinator")
    system("gem install -u solargraph")

    system("npm install -g neovim")
  end
end
