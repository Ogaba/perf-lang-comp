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
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\)\(.*\)/VERSION=\2/
s/Version de\(.*\)\([[:digit:]]\{8\}\)\(.*\)/VERSION=\2/
s/grep (GNU grep)//
s/Version de/VERSION=/
s/MEAN_USER=\(.*\)/MEAN_USER=\1/
s/STDDEV_USER=\(.*\)/STDDEV_USER=\1/
s/PERCENTILE_99_USER=\(.*\)/PERCENTILE_99_USER=\1/
s/MEAN_SYS=\(.*\)/MEAN_SYS=\1/
s/STDDEV_SYS=\(.*\)/STDDEV_SYS=\1/
s/PERCENTILE_99_SYS=\(.*\)/PERCENTILE_99_SYS=\1/
s/MEAN_REAL=\(.*\)/MEAN_REAL=\1/
s/STDDEV_REAL=\(.*\)/STDDEV_REAL=\1/
s/PERCENTILE_99_REAL=\(.*\)/PERCENTILE_99_REAL=\1/
