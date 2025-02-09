cp -i ~/dotfiles/asdf/tool-versions ~/.tool-versions
cp -i ~/dotfiles/asdf/asdfrc ~/.asdfrc
cp -i ~/dotfiles/asdf/default-npm-packages ~/.default-npm-packages

cmd="source ~/dotfiles/asdf/zshrc"
if [[ -z $(rg "$cmd" ~/.zshrc) ]]; then
  echo $cmd >> ~/.zshrc
fi

for language in $(cat ~/.tool-versions); do
  if [[ $language =~ ^[a-z]+$ ]]; then
    asdf plugin add $language
  fi
done

asdf install
