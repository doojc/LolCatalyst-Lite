#!/usr/bin/env perl

use Test::More qw/no_plan/;

BEGIN {
	use_ok( 'CrashCourse::Point' );
}

diag( "Testing CrashCourse::Point $CrashCourse::Point::VERSION, Perl $], $^X" );

my $point = CrashCourse::Point->new( x=> 1, y => 2);
ok ($point -> x == 1, "x is 1");
diag "Coordinates are ", $point->x , "," ,$point->y , "\n";
$point->clear;
diag "Coordinates are ", $point->x , "," ,$point->y , "\n";

