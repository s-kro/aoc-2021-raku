#! /usr/bin/raku

my $fh = open "aoc_2021-1.dat", :r;

my $dc = 0; # down count
my $prev = 10000; # a high number to avoid an   
                  #  error on the first reading
for $fh.IO.lines -> $line {
    # say $line;
    if ($line > $prev) {
	$dc++;
    }
    $prev = $line;
    
}
 
say $dc;
