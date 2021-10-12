class Zsh
  def self.install
    unless Utils.exists?("~/.oh-my-zsh")
      system("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\" \" \" --unattended --keep-zshrc")
    end

    zsh_plugins = [
      "zsh-autosuggestions" => "https://github.com/zsh-users/zsh-autosuggestions",
      "zsh-syntax-highlighting" => "https://github.com/zsh-users/zsh-syntax-highlighting.git",
      "zsh-completions" => "https://github.com/zsh-users/zsh-completions",
      "z.lua" => "https://github.com/skywind3000/z.lua.git"
    ]

    zsh_plugins.each do |name, source|
      next if Utils.exists?("~/.oh-my-zsh/custom/plugins/#{name}")
      system("git clone #{source} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/#{name}")
    end
  end
end
