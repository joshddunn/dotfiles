for fragment in brew asdf git osx dotfiles zsh; do
  sh fragments/$fragment.sh
  echo ""
done

echo "All done!"
