#! /usr/bin/raku

# Advent of Code 2021 Day 10 Part 2

my $fh = open "aoc_2021-10.dat", :r;

my %b = ')' => '(', ']' => '[', '}' => '{', '>' => '<'; # braces
my %p = '(' => 1, '[' => 2, '{' => 3, '<' => 4; # points
my @total_scores = ();

for $fh.IO.lines -> $nav_sub {
    my @buf = ();
    my $corrupted = Bool::False; 
    for $nav_sub.split("", :skip-empty) -> $s {
      	if defined %b{$s} {           # a closing brace
      	   if %b{$s} eq @buf[* - 1] { # matches last open brace
	       @buf.pop;            # ... so just get rid of it
	   } else {
	       $corrupted = Bool::True;
	       last;
	   }
        } else { # save it as the latest open brace
	   @buf.push($s);
	}
    }
    if !$corrupted {
	my $ts = 0; # total score
	for @buf.reverse -> $b {
	    $ts = $ts * 5 + %p{$b};
	}
	push @total_scores, $ts;
    }
}
 
say "Middle score: {@total_scores.sort[(@total_scores.elems - 1) / 2]}";
