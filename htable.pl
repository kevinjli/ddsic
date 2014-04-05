#!/usr/bin/perl

use strict;
use warnings;

my ( %school, %score );

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
    my ( $school, $score );

    format STDOUT_TOP = 
Student                   School                         Score 
------------------------- ------------------------------ -----
.

    format STDOUT = 
@<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @>>>>
$student,                 $school,                       $score
.

    $school = $school{$student};
    $score  = $score{$student};
    $score =~ s/ (\d) (\d\d\d) /$1,$2/gx;
    write;
}

__END__
