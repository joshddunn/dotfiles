for fragment in brew dotfiles asdf zsh; do
  sh fragments/$fragment.sh
  echo ""
done

echo "All done!"
