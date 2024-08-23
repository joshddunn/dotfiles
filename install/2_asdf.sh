cmd=". $(brew --prefix asdf)/libexec/asdf.sh"
if [[ -z $(rg "$cmd" ~/.zshrc) ]]; then
  echo $cmd >> ~/.zshrc
fi

for language in $(cat ~/dotfiles/templates/asdf/tool-versions); do
  if [[ $language =~ ^[a-z]+$ ]]; then
    asdf plugin add $language
  fi
done

asdf install
