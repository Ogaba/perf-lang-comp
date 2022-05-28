#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute kotlin program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... :
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2                : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=kotlin

f_header

echo -n "Version de $PRG_LANG :"
$PRG_LANG -version | grep . | head -n1 | cut -d' ' -f3

for ((_C = 1; _C <= $2; _C++)); do
	f_for_kotlin $PRG_LANG $1 $_C
done

f_eval_command

f_hash $PRG_LANG

f_valgrind $PRG_LANG
