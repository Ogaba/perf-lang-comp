#!/usr/bin/sed -f
#* h**************************************************************************#
# Script sed
#
# Author........... : OGA
# Created.......... : 2015-11-03
# Modified......... :
# Notes............ :
#**************************************************************************h *#
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\.[[:digit:]]\)\(.*\)/\2/
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]][[:digit:]]\)\(.*\)/\2/
s/Version de\(.*\)\([[:digit:]]\+\.[[:digit:]]\)\(.*\)/\2/
s/Version de\(.*\)\([[:digit:]]\{8\}\)\(.*\)/\2/
s/grep (GNU grep)//
s/Version de//
s/MEAN_USER=\(.*\)/\1/
s/STDDEV_USER=\(.*\)/\1/
s/PERCENTILE_99_USER=\(.*\)/\1/
s/MEAN_SYS=\(.*\)/\1/
s/STDDEV_SYS=\(.*\)/\1/
s/PERCENTILE_99_SYS=\(.*\)/\1/
s/MEAN_REAL=\(.*\)/\1/
s/STDDEV_REAL=\(.*\)/\1/
s/PERCENTILE_99_REAL=\(.*\)/\1/
s/HASH=\(.*\)/\1/
s/NB_LIGNES=\(.*\)/\1/
