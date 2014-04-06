#!/usr/bin/perl

use strict;
use warnings;

my ( %school, %score );
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

for my $student ( sort { $score{$b} <=> $score{$a} or $a cmp $b } keys %score )
{
    my ( $rank, $school, $score );

    format STDOUT_TOP = 
Rank Student                   School                         Score 
---- ------------------------- ------------------------------ -----
.

    format STDOUT = 
@>>> @<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @>>>>
$rank,$student,                 $school,                       $score
.
    $rank   = $counter;
    $school = $school{$student};
    $score  = $score{$student};
    $score =~ s/ (\d) (\d\d\d) /$1,$2/gx;
    write;

    $counter++;
}

__END__
