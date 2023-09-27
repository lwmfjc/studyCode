#!/bin/bash
# test-integer2: evaluate the value of an integer
INT=-15
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then #是整数
    if [ $INT -eq 0 ]; then #0
      echo "INT is zero."
    else
      if [ $INT -lt 0 ]; then #<0
        echo "INT is negative."
      else #>0
        echo "INT is positive"
      fi
      if [ $((INT % 2)) -eq 0 ]; then #奇数
        echo "INT is even."
      else #偶数
        echo "INT is odd."
      fi
    fi
else
  echo "INT is not an integer." >&2
  exit 1
fi