#!/Users/fj/perl-bin/bin/perl -w

eval 'exec /Users/fj/perl-bin/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Catalyst::Test 'LolCatalyst::Lite';

my $help = 0;

GetOptions( 'help|?' => \$help );

pod2usage(1) if ( $help || !$ARGV[0] );

print request($ARGV[0])->content . "\n";

1;

=head1 NAME

lolcatalyst_lite_test.pl - Catalyst Test

=head1 SYNOPSIS

lolcatalyst_lite_test.pl [options] uri

 Options:
   -help    display this help and exits

 Examples:
   lolcatalyst_lite_test.pl http://localhost/some_action
   lolcatalyst_lite_test.pl /some_action

 See also:
   perldoc Catalyst::Manual
   perldoc Catalyst::Manual::Intro

=head1 DESCRIPTION

Run a Catalyst action from the command line.

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut