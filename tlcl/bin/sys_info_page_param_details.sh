#!/bin/bash
# Program to output a system information page.
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME , by $USER"
report_uptime() {
  #echo "Function report_uptime executed."
  cat <<_EOF_
 	<H2>System Uptime</H2>
	<PRE>$(uptime)</PRE>
_EOF_
  return
}
report_disk_space() {
  cat <<_EOF_
	<H2>Disk Space Utilization</H2>
	<PRE>$(df -h)</PRE>
_EOF_
  return
}
report_home_space() {
  local format="%8s%10s%10s\n"
  local i dir_list total_files total_dirs total_size user_name
  if [[ $(id -u) -eq 0 ]]; then
      #dir_list=/home/*
      dir_list=/home/ly/foo/lytest
      user_name="All Users"
  else
    dir_list=$HOME
    user_name=$USER
  fi
  echo "<H2>Home Space Utilization ($user_name)</H2>"
  for i in $dir_list; do
    total_files=$(find $i -type f |wc -l)
    total_dirs=$(find $i -type d |wc -l)
    total_size=$(du -sh $i | cut -f 1)
    echo "<H3>$i</H3>"
    echo "<PRE>"
    printf "$format" "Dirs" "Files" "Size"
    printf "$format" "----" "------" "------"
    printf "$format" $total_dirs $total_files $total_size
    echo "</PRE>"
  done
  return
}
#report_home_space() {
#  if [[ $(id -u) -eq 0 ]]; then
#    cat <<-_EOF_
#      <H2>Home Space Utilization(All Users)</H2>
#      <PRE>$(du -sh /home/*)</PRE>
#_EOF_
#  else
#    cat <<-_EOF_
#      <H2>Home Spcae Utilization ($USER)</H2>
#      <PRE>$(du -sh $HOME)</PRE>
#_EOF_
#  fi
#  return
#}

usage() {
  echo "PROGRAM: usage: $PROGRAM [-f file | -i]"
  return
}
write_html_page() {
  cat <<-_EOF_
  <HTML>
   	<HEAD>
   		<TITLE>${TITLE}</TITLE>
   	</HEAD>
   	<BODY>
   		<H1>${TITLE}</H1>
  		<p>$TIME_STAMP</p>
  		$(report_uptime)
  		$(report_disk_space)
  		$(report_home_space)
   	</BODY>
   </HTML>
_EOF_
  return
}
# process command line options
interactive=
filename=
while [[ -n $1 ]]; do
  case $1 in
  -f | --file)
    shift
    filename=$1
    echo "filename: $filename"
    ;;
  -i | --interactive)
    interactive=1
    echo "interactive: $interactive"
    ;;
  -h | --help)
    usage
    exit
    ;;
  *)
    usage >&2
    exit 1
    ;;
  esac
  shift
done

# interactive mode
if [[ -n $interactive ]]; then
  while [ true ]; do
    read -p "Enter name of output file: " filename
    if [[ -e $filename ]]; then
      read -p "'$filename' exists. Override? [y/n/q] "
      case $REPLY in
      Y | y)
        break
        ;;
      Q | q)
        echo "Program terminated."
        exit
        ;;
      *)
        continue
        ;;
      esac
    elif [[ -z $filename ]]; then
      continue
    else
      break
    fi
  done
fi

#output html page
if [[ -n $filename ]]; then
  if touch $filename && [[ -f $filename ]]; then
    write_html_page >$filename
  else
    echo "$PROGRAM: Cannot write file '$filename'" >&2
    exit 1
  fi
else
  write_html_page
fi
