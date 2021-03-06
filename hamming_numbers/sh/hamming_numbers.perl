use List::Util 'min';
# If you want the large output, uncomment either the one line
# marked (1) or the two lines marked (2)
#use Math::GMP qw/:constant/;        # (1) uncomment this to use Math::GMP
use Math::GMPz;                     # (2) uncomment this plus later line for Math::GMPz
 
sub ham_gen {
	my @s = ([1], [1], [1]);
	my @m = (2, 3, 5);
	@m = map { Math::GMPz->new($_) } @m;     # (2) uncomment for Math::GMPz
 
	return sub {
		my $n = min($s[0][0], $s[1][0], $s[2][0]);
		for (0 .. 2) {
			shift @{$s[$_]} if $s[$_][0] == $n;
			push @{$s[$_]}, $n * $m[$_]
		}
 
		return $n
	}
}
 
my ($h, $i) = ham_gen;
 
++$i, print $h->(), "\n" until $i > 19;
 
++$i, $h->() until $i == 1691;
print $h->(), "\n";

$i=1000000;
print $h->(), "\n";
