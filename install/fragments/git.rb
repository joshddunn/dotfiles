class Git
  def self.install
    system('git config --global init.templatedir "~/dotfiles/git-templates"')
    system('git config --global alias.unadd "reset HEAD"')
    system('git config --global pager.diff false')
    system('git config --global push.default current')
  end
end
