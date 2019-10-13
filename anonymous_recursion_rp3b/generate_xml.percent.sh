#!/bin/bash
#* h**************************************************************************#
# Generic bash script to generate XML files
#
# Author........... : OGA
# Created.......... : 2015-11-03
# Modified......... : 2017-12-26
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
function gen_xml() {
 cat log/${2}.${1}.stats.sh.log log/${2}.${1}.stats.sh.log.2 |\
	sed -f sed/percent.sh.log.sed |\
	grep -f grep/${1}.stats.sh.log.grep |\
	gawk -f awk/xml.awk -f awk/generate_xml.stats.awk\
	>> xml/${1}.percent.sh.log.xml
}

function gen_xml2() {
 echo "" | gawk -v file_name="log/*.${1}.stats.sh.log.2" -v algorithm="$1" -f awk/xml.awk\
		-v xsl_file="compare_percent.xsl" -f awk/begin.awk\
		> xml/${1}.percent.sh.log.xml
 for PRG_LANG in $2; do
	echo "Génération des fichiers XML de $PRG_LANG."
	gen_xml $1 "$PRG_LANG"
 done
 cat log/${1}.stats.sh.log.2 | gawk -f awk/xml.awk -f awk/end.awk >> xml/${1}.percent.sh.log.xml
}

# $1 : program name
# $2 : list of langage programs
# Exemple : gen_xml2 left_factorials "bc kotlin perl"
gen_xml2 $1 "$2"
