package DwarfChains;

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
use Catalyst qw/-Debug
                ConfigLoader
                Static::Simple/;
our $VERSION = '0.01';

# Configure the application. 
#
# Note that settings in dwarfchains.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with a external configuration file acting as an override for
# local deployment.

__PACKAGE__->config( name => 'DwarfChains' );

# Start the application
__PACKAGE__->setup();


=head1 NAME

DwarfChains - Catalyst based application

=head1 SYNOPSIS

    script/dwarfchains_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<DwarfChains::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

 sub push_stack {
     my ($self, $caller) = @_;
     my $action_name = $self->stack->[-1]->name;
     my $action = $self->controller->action_for($action_name);
     my $uri = 
         $action ? $self->uri_for($action) : undef;
     push @{ $self->stash->{matches}},
         { ref($caller) => {
             $action_name => $uri,
         },
       }
 }


1;
