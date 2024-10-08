home=$(realpath ~)

if [[ ! -d $home/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" " " --unattended --keep-zshrc
fi

install_plugin() {
  name=$1
  source=$2
  dir=$home/.oh-my-zsh/custom/plugins/$name
  if [[ ! -d $dir ]]; then
    git clone $source $dir
  fi
}

install_plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
install_plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
install_plugin zsh-completions https://github.com/zsh-users/zsh-completions
