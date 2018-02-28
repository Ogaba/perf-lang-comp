#!/usr/bin/sed -f
#* h**************************************************************************#
# Script sed
#
# Author........... : OGA
# Created.......... : 2015-11-03
# Modified......... :
# Notes............ :
#**************************************************************************h *#
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\.[[:digit:]]\)\(.*\)/VERSION=\2/
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]][[:digit:]]\)\(.*\)/VERSION=\2/
s/grep (GNU grep)//
s/Version de/VERSION=/
s/taskset -c [0-9]*/TASKSET=/
s/USER=\(.*\)/USER=\1/
s/SYS=\(.*\)/SYS=\1/
s/REAL=\(.*\)/REAL=\1/
