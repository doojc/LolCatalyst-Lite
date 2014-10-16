package LolCatalyst::Lite;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root 
#                 directory

use parent qw/Catalyst/;
use Catalyst qw/
                ConfigLoader
                Static::Simple
               Authentication
               Authorization::Roles
               Session
               Session::State::Cookie
               Session::Store::FastMmap /;
our $VERSION = '0.01';

# Configure the application. 
#
# Note that settings in lolcatalyst_lite.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with a external configuration file acting as an override for
# local deployment.

if ($ENV{APP_TEST} ) {
    __PACKAGE__->config( 'Plugin::ConfigLoader' =>
                             {file => __PACKAGE__->path_to('t/lib/lolcatalyst_lite_testing.conf')}
                         );
}
__PACKAGE__->config( name => 'LolCatalyst::Lite' );


# Start the application
__PACKAGE__->config( authentication => {
    'default_realm' => 'users',
    'realms' => {
        'users' => {
            'store' => {
                'role_column' => 'role_text',
                'user_class' => 'Auth::User',
                'class' => 'DBIx::Class',
            },
            'credential' => {
                 'password_type' => 'hashed',
                 'password_field' => 'password',
                 'password_hash_type' => 'SHA-1',
                 'class' => 'HTTP',
                 'type' => 'basic',
             }
        }
    },
});__PACKAGE__->setup();


=head1 NAME

LolCatalyst::Lite - Catalyst based application

=head1 SYNOPSIS

    script/lolcatalyst_lite_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<LolCatalyst::Lite::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Freya Jarrett

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
