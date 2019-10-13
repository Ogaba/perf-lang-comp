#!/bin/bash
#* h***************************************************************************
# Common Gnuplot Functions
#
# Author...... : Olivier Gabathuler
# Created..... : 2009-09-16 OGA V1.0.0
# Modified.... : 2016-01-06 OGA V1.1.0
# Notes....... :
#
# Miscellaneous.
# --------------
# - Version: don't forget to update VERSION (look for VERSION below)!
# - Exit codes EXIT_xxxx are for internal use (see below).
#
#**************************************************************************h *#
VERSION=1.1.0
# Function GnuPlot

f_set_terminal_png()
{ # Common header to plot in PNG graphics
 V_SIZE=40
 H_SIZE=120
 H_SIZE2=`echo "$H_SIZE + 8" | bc`
 echo "gnuplot<<EOF" > $_TMP
 echo "set encoding utf8" >> $_TMP
 echo -n "set terminal png size $1,$2 " >> $_TMP
 echo -n "$H_SIZE2 " >> $_TMP
 echo "$V_SIZE + 8" | bc >> $_TMP
}

f_EOF()
{
 printf "\nEOF" >> $_TMP
}

f_set_title()
{ # $1 : title
 echo "set title noenhanced \"${1}\"" >> $_TMP
}

f_set_style_line()
{ # $1 : increment number
  # $2 : color
  # $3 : type of point
 echo "set style line $1 lc rgb '${2}' pt $3" >> $_TMP
}

f_set_border_linewidth()
{ # $1 : linewidth
 echo "set border linewidth $1" >> $_TMP
}

f_set_style_line_circle()
{ # $1 : increment number
  # $2 : color
  f_set_style_line $1 $2 7
}

f_set_point_size()
{ # $1 : point size
 echo "set pointsize $1" >> $_TMP
}

f_set_boxwidth()
{ # $1 : boxwidth
 echo "set boxwidth \"${1}\"" >> $_TMP
}

f_set_style_fill_solid()
{
 echo "set style fill solid" >> $_TMP
}

f_set_multiplot()
{
 echo "set multiplot" >> $_TMP
}

f_set_key_noenhanced()
{
 echo "set key noenhanced" >> $_TMP
}

f_set_margins()
{
 echo "set lmargin at screen 0.2" >> $_TMP
 echo "set rmargin at screen 0.8" >> $_TMP
 echo "set bmargin at screen 0.3" >> $_TMP
 echo "set tmargin at screen 0.7" >> $_TMP
}

f_set_xrange()
{
 printf "\nset xrange [ -0.5 : * ]" >> $_TMP
}

f_set_yrange()
{
 printf "\nset yrange [ 0 : * ]" >> $_TMP
}

f_plot_LF()
{ # $1 : file
 printf "\nplot \"${1}\" u 2:3\n" >> $_TMP
}

f_plot_no_LF()
{ # $1 : file
 printf "\nplot \"${1}\" u 2:3\\" >> $_TMP
}

f_plot_filledcurve_LF()
{ # $1 : file
 printf "\nplot \"${1}\" u 2:3 with filledcurve x1\n" >> $_TMP
}

f_plot_points_LF()
{ # $1 : number
  # $2 : end or not ?
  # $3 : file
 printf "\nplot \"<echo ${3}\" u 6:9 notitle w p ls $1 lw $1,\n" >> $_TMP
 printf "plot \"<echo ${3}\" u 6:9:2 notitle with labels" >> $_TMP
 if [ "$2" == "end" ]; then
	printf "\n" >> $_TMP
 else
	printf ",\n" >> $_TMP
 fi
}

f_plot_lines_LF()
{ # $1 : file
 printf "\nplot \"${1}\" u 2:3 w l\n" >> $_TMP
}

f_set_xlabel_temps()
{
 printf "\nset xlabel \"Temps\"" >> $_TMP
}

f_set_ylabel_pourcentage()
{
 printf "\nset ylabel \"Pourcentage\"" >> $_TMP
}

f_set_ylabel_nombre()
{
 printf "\nset ylabel \"Nombre\"\n" >> $_TMP
}

f_set_ylabel_temps()
{
 printf "\nset ylabel \"Temps de reponse en ms\"\n" >> $_TMP
}

f_set_y2label_MO()
{
 printf "\nset y2label \"Mega Octets\"\n" >> $_TMP
}

f_set_y2label_kbs()
{
 printf "\nset y2label \"kb/s\"" >> $_TMP
}

f_set_xlabel_CPU_user() {
 printf "\nset xlabel \"CPU user\"" >> $_TMP
}

f_set_xlabel_algo_lang() {
 printf "\nset xlabel \"algorithm langage\"" >> $_TMP
}

f_set_ylabel_CPU_sys() {
 printf "\nset ylabel \"CPU sys\"" >> $_TMP
}

f_set_ylabel_CPUs() {
 printf "\nset ylabel \"CPU user+sys time stacked (sec.)\"" >> $_TMP
}

f_plot_cpu_stacked_histo_LF()
{ # $1 : file
 printf "\nset key top left outside horizontal autotitle columnhead" >> $_TMP
 printf "\nset style fill transparent solid 0.7 border 0.25\n" >> $_TMP
 printf "\nset xtics noenhanced border rotate by -45 offset 0,0" >> $_TMP
 printf "\nplot \"${1}\" u (\\\$6+\\\$9):xtic(2) with boxes lc rgb 'blue' t \"mean_cpu_sys\", \"\" u 6:xtic(2) with boxes lc rgb 'green' t \"mean_cpu_user\"" >> $_TMP
}

f_plot_memuse_lines_LF()
{ # $1 : file
 printf "\nset key top center outside horizontal autotitle columnhead" >> $_TMP
 echo -n "set format x \"%H:%M:%S\"" >> $_TMP
 printf "\nset xdata time\n" >> $_TMP
 echo "set timefmt \"%H:%M:%S\"" >> $_TMP
 printf "\nset yrange [ 1 : 100 ] noreverse nowriteback" >> $_TMP
 printf "\nunset ylabel\nunset xlabel\nunset xtics" >> $_TMP
 printf "\nplot \"${1}\" u 1:7 t \"memuse\" w l lc rgb 'orange' lw 5 axes x1y1" >> $_TMP
}

f_plot_memfree_lines_LF()
{ # $1 : file
 printf "\nset key top center outside horizontal autotitle columnhead\n" >> $_TMP
 echo -n "set format x \"%H:%M:%S\"" >> $_TMP
 printf "\nset xdata time\n" >> $_TMP
 echo "set timefmt \"%H:%M:%S\"" >> $_TMP
 printf "\nset yrange [ 1 : 100 ] noreverse nowriteback" >> $_TMP
 printf "\nunset ylabel\nunset xlabel\nunset xtics" >> $_TMP
 printf "\nplot \"${1}\" u 1:7 t \"memfree\" w l lc rgb 'orange' lw 5 axes x1y1" >> $_TMP
}

f_plot_ent_lines_LF()
{ # $1 : file $2 : en_read_name $3 : en_write_name
 printf "\nset key top right outside horizontal autotitle columnhead" >> $_TMP
 printf "\nset style fill transparent solid 0.3\n" >> $_TMP
 echo -n "set format x2 \"%H:%M\"" >> $_TMP
 printf "\nset x2range [00:23]" >> $_TMP
 printf "\nset auto x2" >> $_TMP
 f_set_y2label_kbs
 printf "\nset y2range [ 1 : * ] noreverse nowriteback" >> $_TMP
 printf "\nset y2tics" >> $_TMP
 printf "\nset autoscale y2" >> $_TMP
 printf "\nunset ylabel\nunset xlabel\nunset xtics" >> $_TMP
 printf "\nplot \"${1}\" u 1:5 t \"${2}\" w l lc rgb 'yellow' lw 2 axes x2y2, \"\" u 1:6 t \"${3}\" w l lc rgb 'violet' lw 2 axes x2y2" >> $_TMP
}
