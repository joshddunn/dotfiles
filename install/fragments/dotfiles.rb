class Dotfiles
  def self.install
    Utils.touch('~/dotfiles/nvim/lua/work.lua')

    Utils.append('~/.zshrc', 'source ~/dotfiles/zshrc')
    Utils.append('~/.tmux.conf', 'source-file ~/dotfiles/tmux.conf')

    Utils.mkdir('~/.config/nvim')

    {
      '~/dotfiles/asdf/asdfrc' => '~/.asdfrc',
      '~/dotfiles/asdf/default-gems' => '~/.default-gems',
      '~/dotfiles/asdf/default-npm-packages' => '~/.default-npm-packages',
      '~/dotfiles/asdf/default-python-packages' => '~/.default-python-packages',
      '~/dotfiles/asdf/tool-versions' => '~/.tool-versions',
      '~/dotfiles/nvim/init.lua' => '~/.config/nvim/init.lua',
      '~/dotfiles/nvim/lua' => '~/.config/nvim/lua',
      '~/dotfiles/tmuxinator' => '~/.config/tmuxinator',
      '~/dotfiles/glow.yml' => '~/Library/Preferences/glow/glow.yml'
    }.each { |source, destination| Utils.symlink(source, destination) }
  end
end
