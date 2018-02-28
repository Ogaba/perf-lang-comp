#!/usr/bin/sed -f
#* h**************************************************************************#
# Script sed : formatte la log sudo.log en 6 lignes (DATE, LOGNAME, TTY, PWD, USER, COMMAND)
#
# Author........... : OGA
# Created.......... : 2004-11-03
# Modified......... :
# Notes............ :
#**************************************************************************h *#
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\.[[:digit:]]\)\(.*\)/VERSION=\2/
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]][[:digit:]]\)\(.*\)/VERSION=\2/
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\)\(.*\)/VERSION=\2/
s/Version de\(.*\)\([[:digit:]]\{8\}\)\(.*\)/VERSION=\2/
s/grep (GNU grep)//
s/Version de/VERSION=/
s/</&lt/g
s/>/&gt/g
s/USER=\(.*\)/USER=\1/
s/SYS=\(.*\)/SYS=\1/
s/REAL=\(.*\)/REAL=\1/
