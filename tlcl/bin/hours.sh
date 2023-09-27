#!/bin/bash
# hours: script to count files by modification time
usage() {
  echo "usage: $(basename $0) directory" >&2
}
# Check that argument is a directory
if [[ ! -d $1 ]]; then
  usage
  exit 1
fi
#Initialize array
for i in {0..23}; do hours[i]=0; done
#Collect data
for i in $(stat -c %y "$1"/* | cut -c 12-13); do
j=${i/#0} 
done
