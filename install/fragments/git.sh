echo "Do you want to configure git? (y/n)"
read configure

if [[ $configure != "y" ]]; then
  echo "Skipping git configuration."
  exit
fi

echo "Configuring git..."

##########

git config --global init.templatedir "~/dotfiles/git-templates"
git config --global alias.unadd "reset HEAD"
git config --global pager.diff false
git config --global push.default current
git config --global pull.rebase true
git config --global diff.colorMoved zebra
git config --global push.autoSetupRemote true

##########

echo "Done configuring git."
