#!/bin/bash
# file_info: simple file information program
file_info_fc() {
  # file_info: function to display file information
  if [[ -e $1 ]]; then
    echo -e "\nFile Type:"
    file $1
    echo -e "\nFile Status:"
    stat $1
  else
    echo "$FUNCNAME: usage: $FUNCNAME file" >&2
    return 1
  fi
}
file_info_fc #"/home/ly/bin/read-ifs.sh"
