#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute egrep program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... :
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2                : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=egrep

f_header

echo -n "Version de $PRG_LANG :"
$PRG_LANG -W version 2>/dev/null | grep . | head -n1 | cut -d' ' -f2

for ((_C = 1; _C <= $2; _C++)); do
	f_for_pipe_2 $PRG_LANG $1 $_C
done

eval "$_COMMAND" > ~/tmp/$$.tmp

f_hash $PRG_LANG
