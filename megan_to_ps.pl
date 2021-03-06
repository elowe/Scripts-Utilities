#! /usr/bin/perl
# Author: Eric Lowe
# Script to convert Megan output to resemble Phylosift output
# Takes a .csv file from MEGAN with the first field as read ids
# and the second field as taxids.  Must be comma separated!
# Outputs a file resembling PS output.

use strict; use warnings;

my $input = shift;
open my $fh, $input or die "Couldn't open file: $!";

# print header line for sequence_taxa.txt
print "##Sequence_ID\tHit_Coordinates\tNCBI_Taxon_ID\tTaxon_Rank\tTaxon_Name\tProbability_Mass\tMarkers_Hit\n";
while(<$fh>)
{
    chomp(my $line = $_);
    $line =~ s/-[23]/1/g; # change negative numbers (not assigned/low complexity) to 1 (assign to root)
    $line =~ s/ //g; # remove spaces
    $line =~ s/,/\t/g; # remove commas and replace with tabs
    print "$line\t2.71828\tno rank\tReadsreadsreads\t1\tconcat\n"; # print line with phylosift format
}

exit;
