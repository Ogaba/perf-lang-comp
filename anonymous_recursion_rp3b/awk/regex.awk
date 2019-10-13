#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script regex.awk  : EXPRESSIONS REGULIERES GAWK UTILES
#
# Author........... : OGA
# Created.......... : 2004-10-12
# Modified......... : 2016-09-27
# Notes............ : Version 1.1
# Version GNU awk.. : 3+
#**************************************************************************h *#

# INITIALISATIONS
BEGIN {
# EXPRESSIONS REGULIERES UTILES
	_g_regexp_espaces_debut_ligne="^[[:space:]]+";			# tout espace en debut de ligne
	_g_regexp_espaces_fin_ligne="[[:space:]]+$";			# tout espace en fin de ligne
	#_g_regexp_nombre_decimal="^.?([[:digit:]]+(\\.[[:digit:]]*)?|\\.[[:digit:]]+)$";
	_g_regexp_nombre_decimal="^-?[[:digit:]]+(,[[:digit:]]+)*(\\.[[:digit:]]+(e[[:digit:]]+)?)?$"; 	# un nombre decimal
	#_g_regexp_adresse_ip="^(([01]?[[:digit:]][[:digit:]]?|2[0-4][[:digit:]]|25[0-5])\\.){1,3}([01]?[[:digit:]][[:digit:]]?|2[0-4][[:digit:]]|25[0-5])$";
	_g_regexp_adresse_ip="(^| )(([01]?[[:digit:]][[:digit:]]?|2[0-4][[:digit:]]|25[0-5])\\.){3}([01]?[[:digit:]][[:digit:]]?|2[0-4][[:digit:]]|25[0-5])( |$)"; # une adresse TCP/IP	
	_g_regexp_commentaires_C="/\\*[^*]*\\*+([^/*][^*]*\\*+)*/";	# commentaires C entre slashetoile et etoileslash
	_g_regexp_tnsnames_ora="=\\(.+\\([^(]+\\([^(]+(\\([^)]+\\)){3}\\)\\)\\([^(]+\\([^)]+(\\)){3}"; # structure tnsnames.ora correcte SUR 1 LIGNE
}

# FONCTIONS DEFINIES PAR UTILISATEUR

# POUR CHAQUE LIGNE DU FICHIER EN ENTREE FAIRE

# ACTIONS POST TRAITEMENT
END {
}
