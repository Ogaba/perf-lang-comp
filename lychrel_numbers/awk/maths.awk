#!/usr/local/bin/gawk -f
#* h**************************************************************************#
# Script awk de fonctions mathematiques
#
# Author......    : OGA
# Created.....    : 2003-10-26
# Modified....    : 2015-01-06
# Notes.......    : Version 0.2
# Version GNU awk : 3.1.3
#**************************************************************************h *#

# INITIALISATIONS
BEGIN {
        # http://rosettacode.org/wiki/Real_constants_and_functions
        # Constant of mathematics
        E = exp(1)
        PI = atan2(0, -1)

	# Awk constant
	#IFS=" "
      }

# FONCTIONS DEFINIES PAR UTILISATEUR

function dump(what, array,	i) {
	print what
	# iterate an array in order
	for (i in array) {
		print "  " i ": " array[i]
	}
}

function mean(arr,	i,n,s) {
	for (i in arr) {
		n++
		s += arr[i]
	}
	if (n>0) {
		return(s/n)
	} else {
		return("divide by zero !")
	}
}

function stdev(arr,	i,n,s1,s2,variance,x) {
	for (i in arr) {
		n++
		x = arr[i]
		s1 += x ^ 2
		s2 += x
	}
	if (n>0) {
		variance = ((n * s1) - (s2 ^ 2)) / (n ^ 2)
		if (variance>=0) {
			return(sqrt(variance))
		} else {
			return("sqrt of negative number !")
		}
	} else {
		return("divide by zero !")
	}
}

# percentile [ generalized median ]
function percentile(arr,p,	f,l,r,ddl,lf,n,i) {
	# p = percentile in percent (exemple p=99)
	# f = p but in fraction (exemple f=0.99)
	f = p/100
	for ( i in arr) { ++n }
	asort(arr)
	lf = (n-1)*f+1; l = int(lf); r = n-int(n-lf); ddl = lf-l
	return arr[l]+ddl*(arr[r]-arr[l])
}

# http://rosettacode.org/wiki/Real_constants_and_functions
# Retourne la valeur absolue de x
function abs(x) {
	return x < 0 ? -x : x
}
 
# http://rosettacode.org/wiki/Real_constants_and_functions
# Retourne l'arrondi de x en valeur basse
function floor(x) {
	y = int(x)
	return y > x ? y - 1 : y
}
 
# http://rosettacode.org/wiki/Real_constants_and_functions
# Retourne l'arrondi de x en valeur haute
function ceil(x) {
	y = int(x)
	return y < x ? y + 1 : y
}

# Retourne le min de a ou de b
function min(a, b) {
	return a <= b ? a : b
}

# Retourne le max de a ou de b
function max(a, b) {
	return a >= b ? a : b
}

# do normal rounding
# Arnold Robbins, arnold@skeeve.com, Public Domain
# August, 1996
function round(x,   ival, aval, fraction) {
   ival = int(x)    # integer part, int() truncates

   # see if fractional part
   if (ival == x)   # no fraction
      return ival   # ensure no decimals

   if (x < 0) {
      aval = -x     # absolute value
      ival = int(aval)
      fraction = aval - ival
      if (fraction >= .5)
         return int(x) - 1   # -2.5 --> -3
      else
         return int(x)       # -2.3 --> -2
   } else {
      fraction = x - ival
      if (fraction >= .5)
         return ival + 1
      else
         return ival
   }
}

# Fonction zeta(s)=S(1/n^s)
function zeta(s,		i, sme) {
	for (i = 1; i <= 100000; i++)
		sme = sme + 1 / (i ^ s)
	return sme
}

# Fonction factorielle (ne prend pas en compte les nombres négatifs)
function fact_r(x) {
	return x <= 1 ? 1 : x*fact_r(x-1)
}

# http://fr.wikipedia.org/wiki/Combinatoire
# Fonction de permutation sans répétition d'objets discernables
function perm_without_repetition(x) {
	return fact_r(x);
}

# Fonction de permutation avec répétition d'objets discernables
# Le nombre de permutations de n éléments, répartis dans k classes dont n1 sont de classe 1, n2 sont de classe 2, …, nk sont de classe k, indiscernables dans chaque classe, ou le nombre de permutations de n éléments avec n1, n2, …, nk répétitions, avec \left ( \sum^k_{i=1} n_i = n \right ), est égal à : \frac{n!}{n_1! n_2! \ldots n_k!}.
function perm_with_repetition(tab,	diviseur,i,k,n) {
	diviseur = 1; k = 0; n = 0
	for (i in tab) {
		diviseur = diviseur * fact_r(i)
		k =+ 1
		n = n + i }
	return fact_r(n) / diviseur
}

# Fonction d'arrangement de k objets parmi n objets, sans répétition 
function A_n_k(n,k) {
	return fact_r(n) / fact_r(n-k)
}

# Fonction de combinaison de k objets parmi n objets, sans répétition 
function C_n_k(n,k) {
	return A_n_k(n,k) / fact_r(k)
}

# Fonction de combinaison de k objets parmi n objets, sans répétition 
# Le nombre de combinaisons avec répétition de n éléments pris k à k est égal à : \Gamma_n^k={ n+k-1 \choose k}.
# Donnons l'exemple du jeu de domino. Les pièces sont fabriquées en disposant côte à côte deux éléments de l'ensemble {blanc, 1, 2, 3, 4, 5, 6}. Si nous retournons un domino, nous changeons l'ordre des deux éléments, mais le domino reste identique. Nous avons une combinaison avec répétition de 7 éléments pris 2 à 2, et au total il y a : \Gamma_7^2={8 \choose 2}=28 dominos dans un jeu.
function G_n_k(n,k) {
	return C_n_k(n+k-1,k)
}

# Fonction de factorisation gauche "left factorials"
function left_factorials(n,	i, sme) {
	if (n < 0) return("n is negative !")
	if (n == 0) return 0
	for (i = 0; i < n; i++)
		sme = sme + fact_r(i)
	return sme
}

# ACTIONS POST TRAITEMENT
END     {
}
