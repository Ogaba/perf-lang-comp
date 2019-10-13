#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : stats
#
# Author........... : OGA
# Created.......... : 2016-10-14
# Modified......... : 
# Notes............ : Version 1.0
# Version GNU awk.. : 3+
#**************************************************************************h *#

# INITIALISATIONS
BEGIN { i=1;
}

# POUR CHAQUE LIGNE DU FICHIER EN ENTREE FAIRE
{ arr[i]=$0; i++; }

# ACTIONS POST TRAITEMENT
END {
	printf("MEAN_%s=%g\n",_cpu,mean(arr));
	printf("STDDEV_%s=%g\n",_cpu,stdev(arr));
	printf("PERCENTILE_99_%s=%g\n",_cpu,percentile(arr,99));
}
