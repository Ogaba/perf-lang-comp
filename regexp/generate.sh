#!/bin/bash
#* h**************************************************************************#
# Generic entry bash script
#
# Author........... : OGA
# Created.......... : 2017-10-03
# Modified......... :
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
uname -a > conf_machine.txt
cat /proc/cpuinfo >> conf_machine.txt

. add_path.sh

_NUMBER_OF_ITERATION=8
_PRG_LANG="mawk egrep gawk sed perl python ruby tcl"

cat generate.dat | while read _FILENAME _ROSETTA_CODE; do
	echo $_ROSETTA_CODE " :"
	./generate_logs.stats.sh $_ROSETTA_CODE $_NUMBER_OF_ITERATION "$_FILENAME" "$_PRG_LANG"
	./generate_xml.percent.sh $_ROSETTA_CODE "$_PRG_LANG"
	./generate_xml.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
	./generate_plot.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
done
cd plot && ./gnuplot.sh; cd ..
