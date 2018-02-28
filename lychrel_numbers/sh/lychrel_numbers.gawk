function rev(value) {
    local = 0
    re = 0
    for (sd=0;(value > 0);local++) {
        sd = value % 10
        re = re * 10 + sd
        value = value / 10
    }
    return re
}

function pal(number) {
    if (number == rev(number)) {
	return 0
    } else {
	return 1
    }
}

function integer_part(xx) {
    ss = scale
    scale = 0
    xx /= 1 
    scale = ss
    return xx
}

function trimleft(val) {
    m = val % 10
    for (i=1;(m == 0);i++) {
        val = val / 10
	m = val % 10
    }
    val2 = val
    return val2
}

function step(nn) {
    nn_ = rev(nn)
    nn_ = trimleft(nn_)
    return nn + nn_
}

function search(va) {
    for (aa=0;((visited[aa] != va) && (aa <= max_visited));aa++) {}
    if (aa > max_visited) { 
	return 1
    } else  {
	return 0
    }
}

function merge(max_seq_2) {
    for (bb=0;bb<max_seq_2;bb++) {
	found = 0
	for (cc=0;cc<max_visited;cc++) {
		if (seq[bb] == visited[cc]) {
			found = 1
		}
	}
	if (found == 0) {
		visited[max_visited++] = seq[bb]
	}
    }
}

BEGIN {
    seq[0]=0
    visited[0]=0
    max_search_lychrels = 1000
    iters = 50
    print "Searching for Lychrel numbers in [1,", max_search_lychrels, "]\n"
    print "With a maximum of ", iters, " iterations\n"

    nrelated = 0 
    max_visited = 0
    max_pals = 0
    max_lychrels = 0

    for (ii=1;ii<=max_search_lychrels;ii++) {
        nbr = ii 
	max_seq = 0
        for (jj=0;jj<iters;jj++) {
            nbr = step(nbr)
	    seq[max_seq++] = nbr
            print "seq[",jj,"]=",seq[jj], "\n"
            if (search(nbr) == 0) {
                nrelated = nrelated + 1
                if (pal(ii) == 0) {
                    pals[max_pals++] = ii
		    print "pals[",max_pals-1,"] = ",pals[max_pals-1],"\n"
                }
                break
            }
            if (pal(nbr) == 0) {
                break
            }
        }
        if (jj >= iters) { 
            if (pal(ii) == 0) {
                pals[max_pals++] = ii
            }
            print "pals[",max_pals-1, "] = ", pals[max_pals-1], "\n"
            lychrels[max_lychrels++] = ii
            merge(max_seq) 
        }
    }
    print "Lychrel numbers found:"
    for (kk=0;kk<max_lychrels;kk++) {
	print lychrels[kk], " "
    }
    print "\nCount of related numbers:", nrelated, "\n"
    print "\n", nrelated, "\n"
    print "Palindromic Lychrel and related numbers:\n"
    for (kk=0;kk<max_pals;kk++) {
	print pals[kk], " "
    }
    print "\n"
}
