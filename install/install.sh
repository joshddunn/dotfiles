for fragment in brew dotfiles asdf git osx zsh; do
  sh fragments/$fragment.sh
  echo ""
done

echo "All done!"
