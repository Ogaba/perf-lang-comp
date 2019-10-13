#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : format log file for perf CPU/regexp comparison
#
# Author........... : OGA
# Created.......... : 2004-11-03
# Modified......... : 2019-09-29
# Notes............ : Version 1.1
# Version GNU awk.. : 3+
#**************************************************************************h *#

BEGIN {
	FS="="
}

# for each lines do
/LOG_NAMES/			{ log_names=$2; }
/MOST_PROBABLE_CORRECT_HASH/	{ most_hash=$2; }

END { printf ("%s\n",xml_bottom(log_names,most_hash)); }
