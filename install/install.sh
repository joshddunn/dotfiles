for fragment in $(ls | grep '[0-9]_'); do
  sh $fragment
  echo ""
done

echo "All done!"
