class Dotfiles
  def self.install
    Utils.touch('~/dotfiles/nvim/lua/work.lua')
    Utils.touch('~/dotfiles/zshrc.work')

    Utils.append('~/.zshrc', 'source ~/dotfiles/zshrc')
    Utils.append('~/.zshrc', 'source ~/dotfiles/zshrc.work')
    Utils.append('~/.tmux.conf', 'source-file ~/dotfiles/tmux.conf')

    Utils.mkdir('~/.config/nvim')

    {
      '~/dotfiles/asdfrc' => '~/.asdfrc',
      '~/dotfiles/tool-versions' => '~/.tool-versions',
      '~/dotfiles/tmuxinator' => '~/.config/tmuxinator',
      '~/dotfiles/nvim/init.lua' => '~/.config/nvim/init.lua',
      '~/dotfiles/nvim/lua' => '~/.config/nvim/lua',
      '~/dotfiles/default-gems' => '~/.default-gems',
      '~/dotfiles/default-npm-packages' => '~/.default-npm-packages',
      '~/dotfiles/default-python-packages' => '~/.default-python-packages'
    }.each { |source, destination| Utils.symlink(source, destination) }
  end
end
