# Fonction factorielle (ne prend pas en compte les nombres négatifs)
function fact_r(x) {
	return x <= 1 ? 1 : x*fact_r(x-1)
}

# Fonction de factorisation gauche "left factorials"
function left_factorials(n,	i, sme) {
	if (n < 0) return("n is negative !")
	if (n == 0) return 0
	for (i = 0; i < n; i++)
		sme = sme + fact_r(i)
	return sme
}

END {
for (i=0;i<11;i++) {
print left_factorials(i)
}
for (i=20;i<111;i=i+10) {
print left_factorials(i)
}
for (i=1000;i<10001;i=i+1000) {
print "!",i ,"has ", length(left_factorials(i)), " digits."
}
}
