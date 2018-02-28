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
	#fxsl = sprintf("%s%s",file_name,".xsl");
	printf ("%s\n",xml_header(file_name,"compare.xsl"));
	FS="=";
	rownum=0;
}

# FONCTIONS DEFINIES PAR UTILISATEUR

function xml(	_version,_command,_real,_user,_sys,_hash,_nb_match_regex,_bytes_in_use_at_exit,_bytes_total_heap_usage) {
	printf ("%s%s%s%s%s%s%s%s%s%s%s%s%s\n","<ROW num=\"",rownum,"\">",xml_element(_version),xml_element(_command),xml_element(_real),xml_element(_user),xml_element(_sys),xml_element(_hash),xml_element(_nb_match_regex),xml_element(_bytes_in_use_at_exit),xml_element(_bytes_total_heap_usage),"</ROW>");
}

# POUR CHAQUE LIGNE DU FICHIER EN ENTREE FAIRE

{ if ((NR > 1) && (NR % 9 == 1)) { rownum++; xml(_version,_command,_real,_user,_sys,_hash,_nb_match_regex,_bytes_in_use_at_exit,_bytes_total_heap_usage); } }
/VERSION/		{ _version=$0; }
/COMMAND/		{ _command=$0; }
/REAL/			{ split($2,tab,":"); _seconds=60*tab[1]+tab[2]; _real=sprintf("REAL=%s",_seconds); }
/USER/			{ _user=$0; }
/SYS/			{ _sys=$0; }
/HASH/			{ _hash=$0; }
/NB_LIGNES/		{ _nb_match_regex=$0; }
/BYTES_IN_USE_AT_EXIT/	{ _bytes_in_use_at_exit=$0; }
/BYTES_TOTAL_HEAP_USAGE/{ _bytes_total_heap_usage=$0; }

# ACTIONS POST TRAITEMENT
END {
	# Dernier paragraphe
	rownum++; xml(_version,_command,_real,_user,_sys,_hash,_nb_match_regex,_bytes_in_use_at_exit,_bytes_total_heap_usage);
	printf ("%s\n",xml_bottom());
}
