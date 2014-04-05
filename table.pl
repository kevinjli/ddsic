#!/usr/bin/perl

use strict;
use warnings;

my ( %school, %score, @sorted_scores, @final_scores );
my $counter = 1;

while (<>) {
    if (
        / ( (?:\w+\s+)* \w+ ) , \s* ( (?:\w+\s+)* \w+ ) \s+ ( \d+ (?:\.\d)* ) /x
      )
    {
        $school{$1} = $2;
        $score{$1}  = $3;
    }
}

print "{| class = \"wikitable sortable\" width=\"600\"\n";
print "! Place !! Student !! School !! Score\n";

for my $student ( sort { $score{$b} <=> $score{$a} or $a cmp $b } keys %score )
{
    $score{$student} =~ s/ (\d) (\d\d\d) /$1,$2/gx;
    my $line = "|| $student || $school{$student} || $score{$student}";

    if    ( $counter == 1 ) { $line = "| {{Gold|1}} $line" }
    elsif ( $counter == 2 ) { $line = "| {{Silver|2}} $line" }
    elsif ( $counter == 3 ) { $line = "| {{Bronze|3}} $line" }
    else                    { $line = "| $counter $line" }

    print "|-\n$line\n";

    $counter++;
}

print "|}";

__END__
