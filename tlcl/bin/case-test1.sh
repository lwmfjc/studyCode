#!/bin/bash
read -p "enter word > "
case $REPLY in
  [[:alpha:]]) echo "is a single ..." ;;
  [ABC][0-9][a-b]) echo "is A B C followed by a digit and a|b.." ;;&
  ???) echo "is three characters..." ;;&
  *.txt) echo "is a word ending in ...." ;;
  *) echo "is something else ..." ;;
esac