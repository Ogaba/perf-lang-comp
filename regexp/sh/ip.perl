    use strict;
    use warnings;
     
    my $filename = $ARGV[0];
    open(my $fh, '<:encoding(UTF-8)', $filename)
      or die "Could not open file '$filename' $!";

    use Regexp::Common qw/net/;
 
    while (my $row = <$fh>) {
      chomp $row;
      if ($row =~ /(^| |-)$RE{net}{IPv4}{-keep}( |	|:|\.|$)/) {
      print "$row\n"; }
    }
