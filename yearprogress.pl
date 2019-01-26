#!/usr/bin/perl

use strict;
use warnings;

use Date::Calc qw(Today Day_of_Year Days_in_Year);

my $progress_length = 15;
$progress_length = $ARGV[0] 
    if ( defined $ARGV[0] && $ARGV[0] >= 10 && $ARGV[0] <= 50 );

my ($year,$month,$day) = Today();
my $percent = (Day_of_Year($year,$month,$day) / Days_in_Year($year,12));

# ▓▓▓▓▓▓▓▓░░░░░░░ 56%
printf("%s %0d %%\n", &progress($percent, $progress_length), $percent * 100); 

sub progress {
    my ($percent, $len) = @_;
    my $progress;
    for (my $i=1; $i<=$len; $i++) {
        $progress .= sprintf("%s", ($i <= ($len * $percent)) ? "▓" : "░");
    }
    return $progress;
}

exit 0
