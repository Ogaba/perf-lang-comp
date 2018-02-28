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
s/grep (GNU grep)//
s/Version de/VERSION=/
s/taskset -c [0-9]*/TASKSET=/
s/MEAN_USER=\(.*\)/MEAN_USER=\1/
s/STDDEV_USER=\(.*\)/STDDEV_USER=\1/
s/MEAN_SYS=\(.*\)/MEAN_SYS=\1/
s/STDDEV_SYS=\(.*\)/STDDEV_SYS=\1/
s/MEAN_REAL=\(.*\)/MEAN_REAL=\1/
s/STDDEV_REAL=\(.*\)/STDDEV_REAL=\1/
