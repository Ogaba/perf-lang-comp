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

_ROSETTA_CODE=left_factorials
_NUMBER_OF_ITERATION=16
_PRG_LANG="bc clisp gawk original-awk perl python ruby tcl"

./generate_logs.stats.sh $_ROSETTA_CODE $_NUMBER_OF_ITERATION "$_PRG_LANG"
./generate_xml.percent.sh $_ROSETTA_CODE "$_PRG_LANG"
./generate_xml.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
./generate_plot.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
cd plot && ./gnuplot.sh; cd ..
