#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : format log file of perf CPU/regexp comparaison
#
# Author........... : OGA
# Created.......... : 2004-11-03
# Modified......... : 2019-09-29
# Notes............ : Version 1.1
# Version GNU awk.. : 3+
#**************************************************************************h *#

BEGIN {
}

END { printf ("%s\n",xml_header(algorithm,xsl_file)); }
