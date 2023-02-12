#! /usr/bin/raku

my $fh = open "aoc_2021-1.dat", :r;

my $dc = 0; # down count
my $prev = 10000; # a high number to avoid an   
                  #  error on the first reading
my @buf = ();  # buffer for last 3 depths
my $t_buf = 0; # buffer total 

for $fh.IO.lines -> $depth {
    
    @buf.push($depth);
    
    if (@buf.Int == 3) { # make sure the buffer is full
	$t_buf = @buf.sum(); 
	@buf.shift(); # get rid of the oldest depth
                      # ... @buf.Int = 2
	if ($t_buf > $prev) { # puzzle criterion 
	    $dc++;
	}
	$prev = $t_buf;
    }
}
 
say "Sums larger than previous: $dc";
