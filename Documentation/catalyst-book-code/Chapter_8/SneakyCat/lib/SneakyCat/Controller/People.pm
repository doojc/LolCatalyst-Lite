package SneakyCat::Controller::People;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

SneakyCat::Controller::People - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->forward('login');
}

sub login :Local :Args(0) {
    my ( $self, $c ) = @_;
    
    $c->stash->{'template'} = 'people/login.tt';
    
    if ( $c->user_exists() ) 
    {
        # User is already signed in... Forward to the Ideas page
        $c->response->redirect( $c->uri_for($c->controller('Ideas')->action_for('share') ) );
        return;
    
    } elsif ( exists($c->req->params->{'username'}) ) {
    
        if ($c->authenticate( { 
                                username => $c->req->params->{'username'},
                                password => $c->req->params->{'password'}
                              }) ) 
        {
            ## user is signed in.
            $c->stash->{'message'} = "You are now logged in.";
            $c->response->redirect( $c->uri_for($c->controller('Ideas')->action_for('share') ) );
            $c->detach();
            return;
        } else {
            $c->stash->{'message'} = "Invalid login.";
        }    
    }
    ## if we are here then we need to display the form.
}

sub logout :Local :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{'template'} = 'people/logout.tt';
    
    if ( $c->user_exists() ) {
        $c->logout();
        $c->stash->{'message'} = "You have been logged out.";
    } else {
        $c->stash->{'message'} = "You were not logged in.";
    }
}

=head1 AUTHOR

Jay Kuri

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
