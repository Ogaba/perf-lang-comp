#!/bin/bash
#* h**************************************************************************#
# Generic entry bash script
#
# Author........... : OGA
# Created.......... : 2017-10-03
# Modified......... : 2019-09-29
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
uname -a > conf_machine.txt
cat /proc/cpuinfo >> conf_machine.txt

. add_path.sh

export _DEBUG=1
_NUMBER_OF_ITERATION=8
_PRG_LANG="egrep gawk sed perl python ruby tcl"

cat generate.dat | while read _FILENAME _ROSETTA_CODE; do
	[[ $_DEBUG -eq 1 ]] && echo $_ROSETTA_CODE " :"
	./generate_logs.stats.sh $_ROSETTA_CODE $_NUMBER_OF_ITERATION "$_FILENAME" "$_PRG_LANG"
	./generate_xml.percent.sh $_ROSETTA_CODE "$_PRG_LANG"
	./generate_xml.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
	./generate_plot.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
done
cd plot && ./gnuplot.sh; cd ..

[[ $_DEBUG -eq 1 ]] && grep -A 3 'hash output to compare results between langages' log/*.stats.sh.log
