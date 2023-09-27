#! /usr/bin/raku

# Advent of Code 2021 Day 10 Part 1

my $fh = open "aoc_2021-10.dat", :r;

my %b = ')' => '(', ']' => '[', '}' => '{', '>' => '<';
my %p = ')' => 3, # points
	']' => 57, 
	'}' => 1197, 
	'>' => 25137 ;

my $t_buf = 0; # buffer total 

for $fh.IO.lines -> $nav_sub {
    my @buf = ();
    
    for $nav_sub.split("", :skip-empty) -> $s {
      	if defined %b{$s} { # a closing brace
      	   if %b{$s} eq @buf[* - 1] { # matches last open brace
	       pop @buf; # ... so just get rid of it
	   } else {
	      $t_buf += %p{$s};
	      last;
	   }
        } else { # save it as the latest open brace
	   push @buf, $s;
	}
    }
}
 
say "Total score: $t_buf";
