class Dependencies
  def self.install
    pip = `which pip2` ? "pip2" : "pip"

    system("#{pip} install --upgrade pip")
    system("pip3 install --upgrade pip")

    system("#{pip} install --user pynvim")
    system("pip3 install --user pynvim")
  end
end
