#!/usr/bin/perl

use strict;
use warnings;

my ( %scores, @sorted_scores, @final_scores );

while (<>) {
    if (
/ ( (?:\w+\s+)* \w+ ) , \s* ( (?:\w+\s+)* \w+ ) \s+ ( \d+ (?:\.\d)* ) /x # matches lines of the form "Name, School Score"
      )
    {
        my $name   = $1;
        my $school = $2;
        my $score  = $3;
        my $line   = "|| $name || $school || $score";
        $scores{$line} = $score
          ; # there may be duplicate scores so we use the full line for the hash key
    }
}

for my $score ( sort { $scores{$b} <=> $scores{$a} or $a cmp $b } keys %scores )
{
    @sorted_scores = ( @sorted_scores, $score );
}    # sort from greatest to least, then alphabetically

for ( 1 .. scalar @sorted_scores ) {
    if ( $_ == 1 ) {
        $final_scores[ $_ - 1 ] = "| {{Gold|1}} $sorted_scores[ $_ - 1] ";
    }
    elsif ( $_ == 2 ) {
        $final_scores[ $_ - 1 ] = "| {{Silver|2}} $sorted_scores[ $_ - 1] ";
    }
    elsif ( $_ == 3 ) {
        $final_scores[ $_ - 1 ] = "| {{Bronze|3}} $sorted_scores[ $_ - 1] ";
    }
    else { $final_scores[ $_ - 1 ] = "| $_ $sorted_scores[ $_ - 1] " }
}

print "{| class = \"wikitable sortable\" width=\"600\"\n";
print "! Place !! Student !! School !! Score\n";

for (@final_scores) { print "|-\n$_\n" }

print "|}";

__END__
