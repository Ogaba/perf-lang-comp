#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script gawk : Mise en forme d'un fichier de log de comparaison de perf CPU/regexp
#
# Author........... : OGA
# Created.......... : 2004-11-03
# Modified......... : 2016-09-27
# Notes............ : Version 1.1
# Version GNU awk.. : 3+
#**************************************************************************h *#

# INITIALISATIONS
BEGIN {
	FS="=";
	rownum=0;
}

# FONCTIONS DEFINIES PAR UTILISATEUR

function xml(_rownum,_version,_command,_mean_real,_stddev_real,_percentile_99_real,_mean_user,_stddev_user,_percentile_99_user,_mean_sys,_stddev_sys,_percentile_99_sys,_hash,_nb_match_regex,_bytes_in_use_at_exit,_bytes_total_heap_usage) {
	printf ("%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n","<ROW num=\"",_rownum,"\">",xml_element(_version),xml_element(_command),xml_element(_mean_real),xml_element(_stddev_real),xml_element(_percentile_99_real),xml_element(_mean_user),xml_element(_stddev_user),xml_element(_percentile_99_user),xml_element(_mean_sys),xml_element(_stddev_sys),xml_element(_percentile_99_sys),xml_element(_hash),xml_element(_nb_match_regex),xml_element(_bytes_in_use_at_exit),xml_element(_bytes_total_heap_usage),"</ROW>");
}

# POUR CHAQUE LIGNE DU FICHIER EN ENTREE FAIRE

/VERSION/		{ version=$0; }
/COMMAND/		{ command=$0; }
/MEAN_REAL/		{ mean_real=$0; }
/STDDEV_REAL/		{ stddev_real=$0; }
/PERCENTILE_99_REAL/	{ percentile_99_real=$0; }
/MEAN_USER/		{ mean_user=$0; }
/STDDEV_USER/		{ stddev_user=$0; }
/PERCENTILE_99_USER/	{ percentile_99_user=$0; }
/MEAN_SYS/		{ mean_sys=$0; }
/STDDEV_SYS/		{ stddev_sys=$0; }
/PERCENTILE_99_SYS/	{ percentile_99_sys=$0; }
/HASH/			{ hash=$0; }
/NB_LIGNES/		{ nb_match_regex=$0; }
/BYTES_IN_USE_AT_EXIT/	{ bytes_in_use_at_exit=$0; }
/BYTES_TOTAL_HEAP_USAGE/{ bytes_total_heap_usage=$0; }

# ACTIONS POST TRAITEMENT
END {
	rownum++; xml(rownum,version,command,mean_real,stddev_real,percentile_99_real,mean_user,stddev_user,percentile_99_user,mean_sys,stddev_sys,percentile_99_sys,hash,nb_match_regex,bytes_in_use_at_exit,bytes_total_heap_usage);
}
