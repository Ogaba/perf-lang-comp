#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute kotlin program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2019-09-29
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2		    : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=kotlin

f_header

echo -n "Version of $PRG_LANG :"
$PRG_LANG -version | grep . | head -n1 | awk '{ print $3 }'

# benchmarking loop
for ((_C = 1; _C <= $2; _C++)); do
	[[ $_DEBUG -eq 1 ]] && echo "f_for_kotlin $PRG_LANG $1 $_C"
	f_for_kotlin $PRG_LANG $1 $_C
done

# Run only once to hash outputs and calculate memory usage
# delete [], transform "," to space, and sort numbers on each line
eval "$_COMMAND" | tr -d '[]' | tr ',' ' ' | f_sort_each_line_of_a_file > ~/tmp/$$.tmp
f_hash $PRG_LANG
f_valgrind $PRG_LANG
