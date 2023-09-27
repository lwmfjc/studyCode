#!/bin/bash
#read-validate: validate input
invalid_input() {
  echo "Invalid input '$REPLY'" >&2
  exit 1
}
read -p "Enter a single item > "
# input is empty (invalid)
[[ -z $REPLY ]] && invalid_input
# input is multiple items (invalid)
(($(echo $REPLY | wc -w) > 1)) && invalid_input
# is input a valid filename?
if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
  echo "'$REPLY' is a valid filename."
  #文件是否存在
  if [[ -e $REPLY ]];then
    echo "And file '$REPLY' exists."
  else
    echo "However,file '$REPLY' does not exist."
  fi
  #输入的是浮点型
# if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]];
  if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
      echo  "'$REPLY' is a floating point number."
  else
    echo "'$REPLY' is not a floating point number"
  fi
  #输入的是整数
  if [[ $REPLY =~ ^-?[[:digit:]]+$ ]]; then
      echo "'$REPLY' is an integer."
  else
    echo "'$REPLY' is not an integer."
  fi
else
  echo "The string '$REPLY' is not a valid filename. "
fi
