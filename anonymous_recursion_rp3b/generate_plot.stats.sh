#!/bin/bash
#* h**************************************************************************#
# Generic bash script to generate GNUPLOT files
#
# Author........... : OGA
# Created.......... : 2015-11-03
# Modified......... : 2017-12-26
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
function gen_gnuplot() {
 # N.B. : l'ordre des fichiers a son importance par rapport à l'ordre des commandes sed
 cat log/${2}.${1}.stats.sh.log.2 log/${2}.${1}.stats.sh.log |\
	grep -f grep/plot.sh.log.grep |\
	sed -f sed/plot2.sh.log.sed | sed -f sed/plot.sh.log.sed >> plot/${1}.stats.gp
}

function gen_gnuplot2() {
 echo "lang algorithm mean_cpu_real stddev_cpu_real percentile_99%_cpu_real mean_cpu_user stddev_cpu_user percentile_99%_cpu_user mean_cpu_sys stddev_cpu_sys percentile_99%_cpu_sys version hash nb_lignes" > plot/${1}.stats.gp
 for PRG_LANG in $2; do
	echo "Génération des fichiers GNUPLOT de $PRG_LANG."
	echo -n "$PRG_LANG ${1}.$PRG_LANG " >> plot/${1}.stats.gp; gen_gnuplot $1 "$PRG_LANG"
 done
}

# $1 : program name
# $2 : list of langage programs
# Exemple : gen_gnuplot2 left_factorials "bc kotlin perl"
gen_gnuplot2 $1 "$2"
