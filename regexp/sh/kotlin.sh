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
# $3                : file name
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=kotlin

f_header

echo -n "Version of $PRG_LANG :"
$PRG_LANG -version | grep . | head -n1

for ((_C = 1; _C <= $2; _C++)); do
	f_for_kotlin $PRG_LANG $1 $_C \"$3\"
done

eval "$_COMMAND" | tr -d '[],' | grep . > ~/tmp/$$.tmp

f_hash $PRG_LANG

f_valgrind $PRG_LANG
