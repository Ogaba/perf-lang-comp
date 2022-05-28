#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : print stats
#
# Author........... : OGA
# Created.......... : 2016-10-14
# Modified......... : 2019-09-29
# Notes............ : Version 1.0
# Version GNU awk.. : 3+
#**************************************************************************h *#

BEGIN { i=1;
}

# for each line do
{ arr[i]=$0; i++; }

END {
	printf("MEAN_%s=%g\n",_cpu,mean(arr));
	printf("STDDEV_%s=%g\n",_cpu,stdev(arr));
	printf("PERCENTILE_99_%s=%g\n",_cpu,percentile(arr,99));
}
