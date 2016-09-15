#!/use/bin/env perl
use strict;
use warnings;

my $usage = "Usage: perl $0 inputfile(.EQT) \n";
@ARGV ==1 or die "$usage";
my $eqtfile = $ARGV[0];

open(IN, "< $eqtfile");
my @lines = <IN>;

chomp(@lines);
close(IN);

open(EQT,"> out.txt") or die "can not build file eat-file";
my $i=0;
our $num=0;

while($i<@lines){
	$lines[$i]=~s/^\s+//;
	$lines[$i]=~//g;
	our @dist = split /\s+/,$lines[$i];

    our $year = substr($lines[$i],0,4);
    $year = sprintf("%04d", $year);
    our $mon  = substr($lines[$i],4,2);
    $mon = sprintf("%02d", $mon);
    our $mday = substr($lines[$i],6,2);
    $mday = sprintf("%02d", $mday);
    our $hour = substr($lines[$i],8,2);
    $hour = sprintf("%02d", $hour);
    our $min  = substr($lines[$i],10,2);
    $min = sprintf("%02d", $min);
    our $sec = substr($lines[$i],12,2);
    $sec = sprintf("%02d", $sec);
    our $time = "$hour:$min:$sec.0" ;
    our $lat  = substr($lines[$i],15,5);
     $lat = sprintf("%5.3f", $lat);
    our $lon  = substr($lines[$i],21,6);
     $lon = sprintf("%6.3f", $lon);
    our $mag  = substr($lines[$i],27,4);
    our $dep  = substr($lines[$i],32,2);
    $i++;
  #  printf EQT  "%8d  %8d  %7.4f  %8.4f   %7.3f  %4.2f  %4.2f  %4.2f  %4.2f      %d\n",$daytime,$time,$lat,$lon,$dep,$mag,$x1,$x2,$x3,$num;
    print EQT "$year/$mon/$mday $time $lat $lon $dep $mag ML\n";
}

close(EQT);
