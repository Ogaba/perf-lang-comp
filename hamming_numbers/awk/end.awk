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
	FS="="
}

# FONCTIONS DEFINIES PAR UTILISATEUR

# POUR CHAQUE LIGNE DU FICHIER EN ENTREE FAIRE
/LOG_NAMES/			{ log_names=$2; }
/MOST_PROBABLE_CORRECT_HASH/	{ most_hash=$2; }

# ACTIONS POST TRAITEMENT
END { printf ("%s\n",xml_bottom(log_names,most_hash)); }
