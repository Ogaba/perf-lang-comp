use strict;
use English;
use bigint;
use Const::Fast;
 
const my $n_max => 10_000;
const my $iter_cutoff => 500;
 
my @seq_dump = ();
my @seed_lychrels = ();
my @related_lychrels = ();
for (my $n=1; $n<=$n_max; $n++) {
    my @seq = lychrel_sequence($n);
    if (scalar(@seq) == $iter_cutoff) {
        if (has_overlap(\@seq, \@seq_dump)) {
            push @related_lychrels, $n;
        }
        else {
            push @seed_lychrels, $n;
        }
        @seq_dump = set_union(\@seq_dump, \@seq);
    }
}
print "Number of seed Lychrels <= $n_max: ", scalar(@seed_lychrels), "\n";
print "Seed Lychrels <= $n_max: ", join(q{, }, @seed_lychrels), "\n";
print "Number of related Lychrels <= $n_max: ", scalar(@related_lychrels), "\n";
print "Palindromes among seed and related <= $n_max: ",
      join(q{, },
           sort {$a <=> $b}
                grep {is_palindrome($ARG)} (@seed_lychrels, @related_lychrels)),
      "\n";
exit 0;
 
sub lychrel_sequence {
    my $n = shift;
    my @seq = ();
    for (1 .. $iter_cutoff) {
        $n = next_n($n);
        if (is_palindrome($n)) { return (); }
        else { push @seq, $n; }
    }
    return @seq;
}
 
sub next_n {
    my $n = shift;
    return $n + reverse($n . q{});
}
 
sub is_palindrome {
    my $n = shift;
    return $n eq reverse($n . q{});
}
 
sub has_overlap {
    my ($a, $b) = @ARG;
    my %h;
    foreach my $k (@{$a}) { $h{$k}++; }
    foreach my $k (@{$b}) { return 1 if exists $h{$k}; }
    return 0;
}
 
sub set_union {
    my ($a, $b) = @ARG;
    my %h;
    foreach my $k (@{$a}) { $h{$k}++; }
    foreach my $k (@{$b}) { $h{$k}++; }
    return keys(%h);
}
