#!/bin/bash
#* h**************************************************************************#
# Generic bash functions
#
# Author........... : OGA
# Created.......... : 2017-10-03
# Modified......... :
# Notes............ : keep it as simple as possible
#**************************************************************************h *#

function get_most_probable_correct_hash() {
# $1 : what to search ?
# $2 : where to search ?
declare -A MAP
declare -A MAP2
for _I in `grep $1 $2`; do
	_HASH2=`echo "$_I" | cut -d':' -f2 | cut -d'=' -f2`
	_F2=`echo "$_I" | cut -d':' -f1 | cut -d'/' -f2 | cut -d'.' -f1`
	MAP[$_F2]=$_HASH2
done
for i in "${!MAP[@]}"; do
	((MAP2[${MAP[$i]}]++))
done
for k in "${!MAP2[@]}"; do
    echo "$k - ${MAP2["$k"]}"
done |
sort -n -k3 | tail -n 1 | cut -d' ' -f1
}

f_header() {
	echo "Compute result of CPU time consumed by different programming languages"
	echo ""
}

f_for() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	if [ "$1" == "" ]; then
		_COMMAND="${2}"
	else
		_COMMAND="$1 ${2}.${1} ${4}"
	fi
	f_for_bottom
}

f_for2() {
        # $1 : program langage name
        # $2 : activity to mesure
        # $3 : number of iterations
        f_for_header $3
        _COMMAND="$1 -f ${2}.${1}"
        f_for_bottom
}

f_for2_on_file() {
        # $1 : program langage name
        # $2 : activity to mesure
        # $3 : number of iterations
        # $4 : file name
        f_for_header $3
        _COMMAND="$1 -f ${2}.${1} \"${4}\""
        f_for_bottom
}

f_for_kotlin() {
        # $1 : program langage name
        # $2 : activity to mesure
        # $3 : number of iterations
	# $4 : file name
	# first compile, example : kotlinc lychrel_numbers.kt, gave Lychrel_numbersKt.class
        f_for_header $3
        _COMMAND="$1 ${2^}Kt ${4}"
        f_for_bottom
}

f_for_pipe() {
        # $1 : program langage name
        # $2 : activity to mesure
        # $3 : number of iterations
	# $4 : file name
        f_for_header $3
        _COMMAND="echo \"\" | $1 ${2}.${1} ${4}"
        f_for_bottom
}

f_for_pipe_2() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="echo \"\" | $1 -f ${2}.${1} ${4}"
	f_for_bottom
}

f_for_pipe_with_option() {
	# $1 : program langage name
	# $2 : option for program
	# $3 : activity to mesure
	# $4 : number of iterations
	# $5 : file name
	f_for_header $4
	_COMMAND="echo \"\" | $1 "$2" -f ${3}.${1} ${5}"
	f_for_bottom
}

f_for_header() {
	# $1 : number of iterations
	TASKSET="taskset -c $(($1 % 4))"
}

f_for_bottom() {
	echo "COMMAND=$_COMMAND"
	echo "$_COMMAND" > exec.sh; chmod u+x exec.sh
	/usr/bin/time -f "USER=%U\nSYS=%S\nREAL=%E\nMEMT=%K" ./exec.sh 1>/dev/null
	rm -f exec.sh
}

f_eval_command_bc() {
	# bc needs to delete carriage return du to 70 characters limitation per line output
	eval "$_COMMAND" | sed -z 's:\\\n::' > ~/tmp/$$.tmp
}

f_hash() {
	# $1 : program langage name
	if [ "$1" == "" ]; then
		echo "c compiled : hachage de la sortie pour vérifier que les données en sortie sont les mêmes :"
	else
		echo "$1 : hachage de la sortie pour vérifier que les données en sortie sont les mêmes :"
	fi
	echo -n "HASH="
	shasum -a 256 ~/tmp/$$.tmp | cut -d' ' -f1
	echo -n "NB_LIGNES="
	wc -l ~/tmp/$$.tmp | cut -d' ' -f1
	rm -f ~/tmp/$$.tmp
}
