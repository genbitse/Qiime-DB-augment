#!/usr/bin/env perl

use strict;
use warnings;

while (<>) {
    chomp;
    my @l  = split;
    my @ll = split /\|/, $l[1];    # parse the target ID returned by Blast gi|gi-ID|gb|genbank-ID|
    my $gi = $ll[1];               # the gi ID
    my $gb = $ll[3];               # the gb ID
    $gb =~ s/\.[0-9]+$//;          # strip version number off the end: .1, .2
    my $start = $l[8];             # start of hit in target: > end if - strand
    my $end   = $l[9];             # start of hit in target: < start if - strand
    my $tid   = $l[12];            # taxonid
    print STDOUT "${gi}_${tid}\t$gb\t$start\t$end\n";
}
