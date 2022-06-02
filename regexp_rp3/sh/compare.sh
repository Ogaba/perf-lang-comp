# Comparaison des binaires de recherche d'expression régulières
function common() {
 # $1 : nom du binaire
 # $2 : pattern
 echo -n "Version of ${1} :"
 case ${1} in
  mawk) apt-show-versions  | grep mawk | head -n1 | cut -d' ' -f2;;
  *)    ${1} --version | grep . | head -n1 | cut -d',' -f1;;
 esac
 #_COMMAND="$TASKSET ${1} '${2}' \"$FILE\""
 _COMMAND="$2"
 echo "$_COMMAND"
 echo "$_COMMAND" > exec.sh; chmod u+x exec.sh
 /usr/bin/time -f "USER=%U\nSYS=%S\nREAL=%E" ./exec.sh 1>/dev/null
 eval "$_COMMAND" > ~/tmp/${1}.tmp
 echo "${1} : hachage de la sortie pour vérifier que les données en sortie sont les memes :"
 echo -n "HASH="
 md5sum ~/tmp/${1}.tmp | cut -d' ' -f1 && rm -f ~/tmp/${1}.tmp
 echo "${1} : nombre de lignes passées par la regexp :"
 echo -n "NB_LIGNES="
 eval "$_COMMAND | wc -l"
 echo "$_COMMAND" > a.out
 valgrind --log-file=log/grindout ./a.out 1>/dev/null
 echo "${1} : consommation mémoire :"
 echo -n "BYTES_IN_USE_AT_EXIT="
 grep 'in use at exit' log/grindout | cut -d':' -f2 | cut -d' ' -f2
 echo -n "BYTES_TOTAL_HEAP_USAGE="
 grep 'total heap usage' log/grindout | cut -d':' -f2 | cut -d' ' -f6
 echo ""
}

echo "Recuperation des expressions regulieres pour chaque langage de programmation :"
#`echo $0 | cut -d'.' -f2-3 | tr -d '\\/'`
#SOURCE_ENV=`echo $0 | cut -d'.' -f2 | tr -d '\\/'`".${1}"
#. regexp/${SOURCE_ENV}
#echo $PATTERN $PATTERN_SED $PATTERN_PYTHON
FILE="$2"
echo "Nombre de lignes dans $FILE :"
wc -l "$FILE"
echo ""
echo "Application d'expression regulieres avec differents programmes"
echo "CONFIGURATION :"
cat /proc/cpuinfo > conf_machine.txt
TASKSET="taskset -c 1"

. regexp/egrep.$1
_COMMAND="$TASKSET egrep '$PATTERN' \"$FILE\""
common egrep "$_COMMAND"

. regexp/awk.$1
_COMMAND="$TASKSET awk '/$PATTERN/ { print }' \"$FILE\""
common awk "$_COMMAND"

. regexp/sed.$1
_COMMAND="$TASKSET sed -n '/$PATTERN_SED/ p' \"$FILE\""
common sed "$_COMMAND"

. regexp/gawk.$1
_COMMAND="$TASKSET gawk '/$PATTERN/ { print }' \"$FILE\""
common gawk "$_COMMAND"

. regexp/mawk.$1
_COMMAND="$TASKSET mawk '/$PATTERN_MAWK/ { print }' \"$FILE\""
common mawk "$_COMMAND"

. regexp/perl.$1
_COMMAND="$TASKSET perl -ne 'print if /$PATTERN/' \"$FILE\""
common perl "$_COMMAND"

. regexp/python.$1
_COMMAND="$TASKSET python -c 'import re
fh = open(\"${FILE}\")
for line in fh:
    if re.search(r\"${PATTERN_PYTHON}\",line):
        print line
fh.close()' | grep ."
common python "$_COMMAND"

. regexp/ruby.$1
_COMMAND="$TASKSET ruby 'str = IO.read($FILE) \
p str if str =~ /$PATTERN_RUBY/ \
| grep ."
common ruby "$_COMMAND"

# Nettoyage
rm -f exec.sh
