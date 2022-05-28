#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute gawk program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2022-05-18
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2                : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=gawk

f_header

echo -n "Version de $PRG_LANG :"
$PRG_LANG --version | grep . | head -n1 | cut -d',' -f1

for ((_C = 1; _C <= $2; _C++)); do
	f_for2_on_file $PRG_LANG $1 $_C Traceback.txt
done

eval "$_COMMAND" > ~/tmp/$$.tmp

f_hash $PRG_LANG

f_valgrind $PRG_LANG
