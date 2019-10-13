#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute haskell program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2019-09-29
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2                : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=haskell

f_header

echo -n "Version de $PRG_LANG :"
/usr/local/bin/stack --version | grep . | head -n1 | cut -d' ' -f2

# benchmarking loop
for ((_C = 1; _C <= $2; _C++)); do
	[[ $_DEBUG -eq 1 ]] && echo "f_for_haskell $PRG_LANG $1 $_C"
	f_for_haskell $PRG_LANG $1 $_C
done

# Run only once to hash outputs and calculate memory usage
	# delete [], transform , to space, and sort numbers on each line
	eval "$_COMMAND" | tr -d '[]' | tr ',' ' ' | sed 's/ /\n/g' > ~/tmp/$$.tmp
	f_hash $PRG_LANG
	f_valgrind $PRG_LANG
