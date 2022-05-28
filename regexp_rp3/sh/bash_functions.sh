#!/bin/bash
#* h**************************************************************************#
# Generic bash functions for perf-lang-comp
#
# Author........... : OGA
# Created.......... : 2017-10-03
# Modified......... : 2022-05-18
# Notes............ : keep it as simple as possible
#**************************************************************************h *#

function get_most_probable_correct_hash() {
	# $1 : what to search (regexp) ?
	# $2 : where to search (file name) ?
	grep $1 $2 |		# search regexp, here HASH, in file, here log/*.stats.sh.log,
	cut -d'=' -f2 |		# select 2nd field of grep output, aka the value of HASH,
	sort |			# perform a sort on all the values, it is mandatory for the
	uniq -c |		# count of how many time values are present,
	sort -g -k1 |		# now do a general numeric sort on the resulted counts
	tail -n 1 |		# to keep only the highest count of sorted values.
	rev |			# And then, that's the trick part : we reverse
	cut -d' ' -f1 |		# to only select the value from the begining of the line now.
	rev			# Oh wait value is also reversed, so.. we reverse again.
# and YES I love coreutils and util-linux !
}

f_sort_each_line_of_a_file() {
	# perl syntax to sort numericaly and asc
	perl -ape '@F=sort{$a<=>$b}@F;$_="@F\n"'
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
		_COMMAND="$TASKSET ${2}"
	else
		_COMMAND="$TASKSET $1 ${2}.${1} \"${4}\""
	fi
	f_for_bottom
}

f_for2() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="$TASKSET $1 -f ${2}.${1} \"${4}\""
	f_for_bottom
}

f_for3() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="$TASKSET $1 -f ${2}.${1} \"${4}\" < /dev/null"
	f_for_bottom
}

f_for_kotlin() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	# first compile, example : kotlinc lychrel_numbers.kt, gave Lychrel_numbersKt.class
	f_for_header $3
	_COMMAND="$TASKSET $1 ${2^}Kt \"${4}\""
	f_for_bottom
}

f_for_jq() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : data file to be processed
	# $4 : number of iterations
	f_for_header $4
	_COMMAND="$TASKSET $1 -rRs -f ${2}.${1} $3"
	f_for_bottom
}

f_for_haskell() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="$TASKSET /usr/local/bin/stack run${1} ${2}.hk \"${4}\""
	f_for_bottom
}

f_for_pipe() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="$TASKSET echo \"\" | $1 ${2}.${1} \"${4}\""
	f_for_bottom
}

f_for_pipe_2() {
	# $1 : program langage name
	# $2 : activity to mesure
	# $3 : number of iterations
	# $4 : file name
	f_for_header $3
	_COMMAND="$TASKSET echo \"\" | $1 -f ${2}.${1} \"${4}\""
	f_for_bottom
}

f_for_pipe_with_option() {
	# $1 : program langage name
	# $2 : option for program
	# $3 : activity to mesure
	# $4 : number of iterations
	# $5 : file name
	f_for_header $4
	_COMMAND="$TASKSET echo \"\" | $1 "$2" -f ${3}.${1} ${5}"
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
		echo "c compiled : hash output to compare results between langages :"
	else
		echo "$1 : hash output to compare results between langages :"
	fi
	[[ $_DEBUG -eq 1 ]] && cat ~/tmp/$$.tmp
	echo -n "HASH="
	shasum -a 256 ~/tmp/$$.tmp | cut -d' ' -f1
	echo -n "NB_LIGNES="
	wc -l ~/tmp/$$.tmp | cut -d' ' -f1
	rm -f ~/tmp/$$.tmp
}

f_valgrind() {
	# $1 : program langage name
	echo "$_COMMAND" > a.out && chmod u+x a.out
	valgrind --log-file=grindout ./a.out 1>/dev/null
	echo "$1 : memory usage :"
	echo -n "BYTES_IN_USE_AT_EXIT="
	grep 'in use at exit' grindout | cut -d':' -f2 | cut -d' ' -f2
	echo -n "BYTES_TOTAL_HEAP_USAGE="
	grep 'total heap usage' grindout | cut -d':' -f2 | cut -d' ' -f6
	rm -f grindout
}
