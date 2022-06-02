#!/bin/bash
#* h**************************************************************************#
# Generic bash script to execute awk program
#
# Author........... : OGA
# Created.......... : 2017-12-12
# Modified......... : 2018-01-12
# Notes............ : keep it as simple as possible
# $1		    : activity to mesure
# $2		    : number of iterations
#**************************************************************************h *#
. bash_functions.sh
PRG_LANG=awk

f_header

echo -n "Version of $PRG_LANG :"
$PRG_LANG --version | grep . | head -n1 | awk '{ print $3 }' | tr -d ','

for _CPT in {1..${2}}; do
	f_for_pipe_2 $PRG_LANG $1 $2
done

eval "$_COMMAND" > ~/tmp/$$.tmp

f_hash $PRG_LANG

f_valgrind $PRG_LANG
