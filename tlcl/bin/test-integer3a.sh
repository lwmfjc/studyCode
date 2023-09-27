#!/bin/bash
# test-integer3: determine if an integer is within a
# specified range of values.
MIN_VAL=1
MAX_VAL=100
INT=50
#如果是整数
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  if [ ! \( $INT -ge $MIN_VAL -a $INT -le $MAX_VAL \) ]; then
    echo "$INT is outside $MIN_VAL to $MAX_VAL."
  else
    echo "$INT is in of range."
  fi
fi
