#!/bin/bash
# test-string: evaluate the value of a string
ANSWER=""
if [ -z "$ANSWER" ]; then
  echo "There is no answer." >&2
  exit 1
fi
if [ "$ANSWER" = "yes" ];then
  echo "The answer is YES."
elif [ "$ANSWER" = "no" ];then
  echo "The answer is NO"
else
  echo "The answer is UNKNOWN."
fi