package SneakyCat;

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
                -Debug
                ConfigLoader
                Static::Simple
                Authentication
                Authorization::Roles
                Session
                Session::State::Cookie
                Session::Store::FastMmap
               /;
our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in sneakycat.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config( name => 'SneakyCat',

                     'View::TT' => {
                         INCLUDE_PATH => [
                             __PACKAGE__->path_to('root', 'src'),
                             __PACKAGE__->path_to('root', 'lib')
                         ],
                         TEMPLATE_EXTENSION => '.tt',
                         CATALYST_VAR       => 'c',
                         TIMER              => 0,
                         PRE_PROCESS        => 'config/main',
                         WRAPPER            => 'site/wrapper'
                     },
                     'Plugin::Authentication' => {
                         default => {
                            credential => {
                                class => 'Password',
                                password_type => 'crypted'
                            },
                            store => {
                                class => 'DBIx::Class',
                                user_model => 'SneakyCat::Users',
                                role_relation => 'roles',
                                role_field => 'role',
                                use_userdata_from_session => '1'
                            }
                        }
                    }
                     
                     # if we were using SimpleDB, the config would be
                     # much simpler.  
                     # class =SimpleDB
                     # user_model = SneakyCat::Users 
                     #
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

SneakyCat - Catalyst based application

=head1 SYNOPSIS

    script/sneakycat_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<SneakyCat::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Jay Kuri

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
