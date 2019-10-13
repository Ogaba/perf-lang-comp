#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute C program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... :
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2                : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=""

f_header

echo -n "Version de $PRG_LANG :"
gcc --version | grep . | head -n1 | cut -d' ' -f3 | tr -d ')'

for ((_C = 1; _C <= $2; _C++)); do
	f_for "${PRG_LANG}" ./${1}.o $_C
done

eval "$_COMMAND" > ~/tmp/$$.tmp

f_hash $PRG_LANG
