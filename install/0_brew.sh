if [[ -e $(which brew) ]]; then
  echo "brew already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file=./Brewfile

touch Brewfile.lock.json
rm ./Brewfile.lock.json
