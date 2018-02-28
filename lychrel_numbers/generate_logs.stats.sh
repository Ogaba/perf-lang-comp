#!/bin/bash
#* h**************************************************************************#
# Generic bash script to mesure perfs of various programs
#
# Author........... : OGA
# Created.......... : 2015-11-03
# Modified......... : 2017-12-26
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
function gen_stat() {
 cd ./sh && ./${1}.sh $2 $3 > ../log/${1}.${2}.stats.sh.log 2>&1 && cd ..
 # Elapsed real (wall clock) time used by the process, in [hours:]minutes.seconds. Keep only minutes.seconds (cut)
 grep REAL log/${1}.${2}.stats.sh.log | sed 's/REAL=//' | cut -d':' -f2 | gawk -f awk/maths.awk -f awk/stats.awk -v _cpu=REAL > log/${1}.${2}.stats.sh.log.2
 grep USER log/${1}.${2}.stats.sh.log | sed 's/USER=//' | gawk -f awk/maths.awk -f awk/stats.awk -v _cpu=USER >> log/${1}.${2}.stats.sh.log.2
 grep SYS log/${1}.${2}.stats.sh.log | sed 's/SYS=//' | gawk -f awk/maths.awk -f awk/stats.awk -v _cpu=SYS >> log/${1}.${2}.stats.sh.log.2
}

function gen_stat2() {
 for PRG_LANG in $3; do
  if [ -x sh/${PRG_LANG}.sh ]; then
   echo "Génération des stats de ${PRG_LANG}.sh."
   gen_stat $PRG_LANG $1 $2
  else
   echo "Vérifiez ${PRG_LANG}.sh."
  fi
 done
 echo "LOG_NAMES=`ls log/*.stats.sh.log`" > log/${1}.stats.sh.log.2
 echo "MOST_PROBABLE_CORRECT_HASH=`get_most_probable_correct_hash HASH \"log/*.stats.sh.log\"`" >> log/${1}.stats.sh.log.2
}

# $1 : activity to mesure
# $2 : number of iterations
# $3 : list of langage programs
# Exemple : gen_stat2 left_factorials 4 "bc kotlin perl"
. sh/bash_functions.sh
gen_stat2 $1 $2 "$3"
