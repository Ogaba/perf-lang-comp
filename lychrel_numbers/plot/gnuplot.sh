#!/bin/bash
#* h***************************************************************************
# Generate Gnuplot from various data collected.
#
# Author...... : Olivier Gabathuler
# Created..... : 2009-09-16 OGA V1.0.0
# Modified.... : 2017-12-26 OGA V1.1.1
# Notes....... :
#
# Miscellaneous.
# --------------
# - Version: don't forget to update VERSION (look for VERSION below)!
# - Exit codes EXIT_xxxx are for internal use (see below).
#
#**************************************************************************h *#
# Fonctions communes GnuPlot
. fonctions.sh

# Fonction specifique GnuPlot
f_gnuplot() {
 # Generating png gnuplot
 f_set_terminal_png 3600 2400
 f_set_point_size 10
 f_set_border_linewidth 1.5
 f_set_style_line_circle 1 red
 f_set_style_line_circle 2 yellow
 f_set_style_line_circle 3 green
 f_set_style_line_circle 4 black
 f_set_style_line_circle 5 blue
 f_set_style_line_circle 6 orange
 f_set_margins
 f_set_multiplot
 f_set_title "$1"
 f_set_xlabel_CPU_user
 f_set_ylabel_CPU_sys
 f_set_xrange 25
 f_set_yrange 0.5
 _A=`wc -l $2 | cut -d' ' -f1`
 for ((_B=2;_B<${_A};_B++)); do
	f_plot_points_LF $(($_B - 1)) "no" "`head -n $_B $2 | tail -n 1 | cut -d' ' -f2-`"
 done
 f_plot_points_LF $(($_A - 1)) "end" "`head -n $_A $2 | tail -n 1 | cut -d' ' -f2-`"
 f_EOF
}

f_gnuplot2() {
 # Generating png gnuplot
 f_set_terminal_png 3600 2400
 f_set_point_size 10
 f_set_border_linewidth 1.5
 f_set_style_line_circle 1 red
 f_set_style_line_circle 2 yellow
 f_set_style_line_circle 3 green
 f_set_style_line_circle 4 black
 f_set_style_line_circle 5 blue
 f_set_style_line_circle 6 orange
 f_set_margins
 f_set_key_noenhanced
 f_set_boxwidth 0.5
 f_set_title "$1"
 f_set_xlabel_algo_lang
 f_set_ylabel_CPUs
 f_set_xrange 6
 f_set_yrange 32
 f_plot_cpu_stacked_histo_LF $2
 f_EOF
}

# Main
echo "Begining $0"

# Version
VERSION=1.1.1

# Gnuplot Data
_TMP=~/tmp/$0.tmp.$$
_DATA="*.gp"

# Generate Plot if data exists
ls $_DATA | while read _FIC; do
 echo " generating ${_FIC}.png ..."
 >$_TMP
 _DATEE=`date '+%Y-%m-%d'`
 _NAME=`basename $_FIC| cut -d'.' -f1`
 #f_gnuplot "$_DATEE : $_NAME" $_FIC
 f_gnuplot2 "$_DATEE : $_NAME" $_FIC
 chmod u+x $_TMP
 $_TMP > ${_FIC}.png
 #cat $_TMP
 rm $_TMP 2>/dev/null
done

# End
echo "Ending $0"
