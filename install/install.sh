for fragment in brew dotfiles asdf zsh; do
  sh $fragment.sh
  echo ""
done

echo "All done!"
