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
#report_home_space(){
# cat <<- _EOF_
#	<H2>Home Space Utilization</H2>
#	<PRE>$(du -sh /home/*)</PRE>
#_EOF_
#return
#}
report_home_space() {
  if [[ $(id -u) -eq 0 ]]; then
    cat <<-_EOF_
      <H2>Home Space Utilization(All Users)</H2>
      <PRE>$(du -sh /home/*)</PRE>
_EOF_
  else
    cat <<-_EOF_
      <H2>Home Spcae Utilization ($USER)</H2>
      <PRE>$(du -sh $HOME)</PRE>
_EOF_
  fi
  return
}
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