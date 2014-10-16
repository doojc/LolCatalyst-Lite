#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Greeter' );
}

diag( "Testing Greeter $Greeter::VERSION, Perl $], $^X" );
