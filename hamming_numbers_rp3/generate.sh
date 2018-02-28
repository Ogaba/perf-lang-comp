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
_ROSETTA_CODE=hamming_numbers
_NUMBER_OF_ITERATION=4
./generate_logs.stats.sh $_ROSETTA_CODE $_NUMBER_OF_ITERATION
./generate_xml.percent.sh $_ROSETTA_CODE
./generate_xml.stats.sh $_ROSETTA_CODE
