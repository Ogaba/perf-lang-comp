#!/bin/bash
#* h**************************************************************************#
# Generic entry bash script
#
# Author........... : OGA
# Created.......... : 2017-10-03
# Modified......... :
# Notes............ : keep it as simple as possible
#**************************************************************************h *#
cat generate.dat | while read _FILENAME _ROSETTA_CODE; do
	./generate_logs.stats.sh $_ROSETTA_CODE $_FILENAME
	./generate_xml.percent.sh $_ROSETTA_CODE
	./generate_xml.stats.sh $_ROSETTA_CODE
done
