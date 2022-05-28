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
_ROSETTA_CODE=Count_examples
_NUMBER_OF_ITERATION=1
#_PRG_LANG="awk bc clisp gawk mawk kotlin haskell perl python ruby tcl"
_PRG_LANG="bash perl python3"

./generate_logs.stats.sh $_ROSETTA_CODE $_NUMBER_OF_ITERATION "$_PRG_LANG"
./generate_xml.percent.sh $_ROSETTA_CODE "$_PRG_LANG"
./generate_xml.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
./generate_plot.stats.sh $_ROSETTA_CODE "$_PRG_LANG"
cd plot && ./gnuplot.sh; cd ..

[[ $_DEBUG -eq 1 ]] && grep -A 3 'hash output to compare results between langages' log/*.stats.sh.log
