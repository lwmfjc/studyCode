#!/bin/bash
# read-integer: evaluate the value of an integer
echo -n "Please enter an integer -> "
read int
if [[ "$int" =~ ^-?[0-9]+$ ]]; then #是整数
    if [ $int -eq 0 ]; then #0
      echo "$int is zero."
    else
      if [ $int -lt 0 ]; then #<0
        echo "$int is negative."
      else #>0
        echo "$int is positive"
      fi
      if [ $((int % 2)) -eq 0 ]; then #奇数
        echo "$int is even."
      else #偶数
        echo "$int is odd."
      fi
    fi
else
  echo "$int is not an integer." >&2
  exit 1
fi