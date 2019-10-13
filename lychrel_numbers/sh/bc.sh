#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute bc program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2019-09-29
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2		    : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=bc

f_header

echo -n "Version de $PRG_LANG :"
$PRG_LANG --version | grep . | head -n1 | cut -d',' -f1

# benchmarking loop
for ((_C = 1; _C <= $2; _C++)); do
	[[ $_DEBUG -eq 1 ]] && echo "f_for $PRG_LANG $1 $_C"
	f_for $PRG_LANG $1 $_C
done

# Run only once to hash outputs and calculate memory usage
	# bc needs to delete carriage return du to 70 characters limitation per line output
	f_eval_command_bc
	f_hash $PRG_LANG
	f_valgrind $PRG_LANG
