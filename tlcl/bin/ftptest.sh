#!/bin/bash
#Script to retrieve a file via FTP
FTP_SERVER=ftp.nl.debian.org
FTP_PATH=/debian/dists/stable/main/installer-i386/current/images/cdrom
REMOTE_FILE=debian-cd_info.tar.gz
ftp -n <<- _EOF_
open $FTP_SERVER
user anonymous ly@debian-ly
cd $FTP_PATH
hash
get $REMOTE_FILE
by
_EOF_
ls -l $REMOTE_FILE
