for fragment in $(ls | grep '[0-9]_'); do
  echo "Do you want to run $fragment? (y/n)"
  read run

  if [[ $run == "y" ]]; then
    sh $fragment
  fi

  echo ""
done

echo "All done!"
