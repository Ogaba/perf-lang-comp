# Comparaison des binaires dans la recherche d'un nombre de hamming
echo "Comparaison des binaires dans la recherche d'un nombre de hamming :"
echo ""
echo "CONFIGURATION :"
echo -n "Version de egrep :"
egrep --version | grep . | head -n1 | cut -d',' -f1
for _CPT in {1..32}; do
 TASKSET="taskset -c $(($_CPT % 4))"
 _COMMAND="$TASKSET egrep -f hamming_numbers.grep"
 echo "$_COMMAND"
 echo "$_COMMAND" > exec.sh; chmod u+x exec.sh
 /usr/bin/time -f "USER=%U\nSYS=%S\nREAL=%E\nMEMT=%K" ./exec.sh 1>/dev/null
 rm -f exec.sh
done
eval "$_COMMAND" > ~/tmp/egrep.tmp
echo "egrep : hachage de la sortie pour vérifier que les données en sortie sont les memes :"
echo -n "HASH="
shasum -a 256 ~/tmp/egrep.tmp | cut -d' ' -f1
echo -n "NB_LIGNES="
wc -l ~/tmp/egrep.tmp
rm -f ~/tmp/egrep.tmp
echo "$_COMMAND" > a.out && chmod u+x a.out
valgrind --log-file=grindout ./a.out 1>/dev/null
echo "egrep : consommation mémoire :"
echo -n "BYTES_IN_USE_AT_EXIT="
grep 'in use at exit' grindout | cut -d':' -f2 | cut -d' ' -f2
echo -n "BYTES_TOTAL_HEAP_USAGE="
grep 'total heap usage' grindout | cut -d':' -f2 | cut -d' ' -f6
rm -f grindout
