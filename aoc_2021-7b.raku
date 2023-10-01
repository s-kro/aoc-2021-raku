#! /usr/bin/raku


# Advent of Code Day 7 Part 2 🦀

use Math::Libgsl::Statistics;
use NativeCall; # hack to pull in the gsl lib definitions!

sub f() is native('gslcblas') { * }, try f();


my $fh = open "aoc_2021-7.dat", :r;
my @chp = ();

for $fh.IO.lines -> $horiz_pos {
    for +<< $horiz_pos.split(",", :skip-empty) -> $hp {
	@chp.push($hp); # as integers!!!!
    }
}

my $ap = mean(@chp).floor;

my $tf = 0; # total fuel
for @chp -> $hp {
    $tf += [+] 0 ... ($hp - $ap).abs;
}
say "🦀's fuel expenditure: $tf";
