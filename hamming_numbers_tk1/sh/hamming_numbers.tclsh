variable hamming 1 hi2 0 hi3 0 hi5 0
proc hamming {n} {
    global hamming hi2 hi3 hi5
    set h2 [expr {[lindex $hamming $hi2]*2}]
    set h3 [expr {[lindex $hamming $hi3]*3}]
    set h5 [expr {[lindex $hamming $hi5]*5}]
    while {[llength $hamming] < $n} {
	lappend hamming [set h [expr {
	    $h2<$h3
	        ? $h2<$h5 ? $h2 : $h5
	        : $h3<$h5 ? $h3 : $h5
	}]]
	if {$h==$h2} {
	    set h2 [expr {[lindex $hamming [incr hi2]]*2}]
	}
	if {$h==$h3} {
	    set h3 [expr {[lindex $hamming [incr hi3]]*3}]
	}
	if {$h==$h5} {
	    set h5 [expr {[lindex $hamming [incr hi5]]*5}]
	}
    }
    return [lindex $hamming [expr {$n - 1}]]
}

variable cpt 1
while {$cpt < 21} {
	puts "[hamming $cpt]"
	incr cpt
} 
puts "[hamming 1691]"
#puts "hamming{1000000} = [hamming 1000000]"
puts "[hamming 1000000]"
