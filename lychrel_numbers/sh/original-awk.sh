#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute original-awk program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2019-09-29
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2		    : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=original-awk

f_header

echo -n "Version de $PRG_LANG :"
$PRG_LANG --version | grep . | head -n1 | cut -d' ' -f3

# benchmarking loop
for _CPT in {1..${2}}; do
	[[ $_DEBUG -eq 1 ]] && echo "f_for_pipe_2 $PRG_LANG $1 $2"
	f_for_pipe_2 $PRG_LANG $1 $2
done

# Run only once to hash outputs and calculate memory usage
	eval "$_COMMAND" > ~/tmp/$$.tmp
	f_hash $PRG_LANG
	f_valgrind $PRG_LANG
