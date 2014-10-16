package SneakyCat::Controller::Ideas;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

SneakyCat::Controller::Ideas - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

index just forwards to share.  

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    return $c->forward('share')
}

=head2 share

share is where SneakyCat shares his ideas.  

=cut

sub share :Local :Args(0) {
    my ( $self, $c ) = @_;
    
    $c->stash->{'template'} = 'ideas/share.tt';
    
    my $idea_rs;
    if ( $c->user_exists() ) {
        
        ## SneakyCat knows you, and will share his secrets
        ## so we make our $idea_rs a resultset that loads all of SneakyCat's ideas

        $idea_rs = $c->model('SneakyCat::Ideas')->search(undef, { order_by => 'id DESC'} );
        
    } else {
        
        ## If SneakyCat doesn't know you, we want to load only SneakyCat's ideas
        ## that are not secret... so we set up our $idea_rs resultset to match that.
        
        $idea_rs = $c->model('SneakyCat::Ideas')->search({ 'secret' => 'no'}, { order_by => 'id DESC' });
        
    }
    
    @{$c->stash->{'ideas'}} = $idea_rs->all();
}

=head2 whisper

whisper is where you tell your idea to SneakyCat.  

=cut


sub whisper :Local :Args(0) {
    my ( $self, $c ) = @_;
    
    $c->stash->{'template'} = 'ideas/whisper.tt';
    
    if ($c->user_exists() && $c->check_user_roles( qw/ can_whisper /) ) {
        ## do whispery things
        my $current_time = scalar localtime();
        if (exists($c->req->params->{'whisper'}) && length($c->req->params->{'whisper'}) > 1) {
            $c->model('Ideas')->create( {
                                            text => $c->req->params->{'whisper'},
                                            secret => $c->req->params->{'secret'},
                                            added_by => $c->user->get('username'),
                                            added => $current_time
                                        } );
                                        
            ## Now we update the user - first we get the underlying DBIx::Class object
            ## then we set the value and save it.
            my $user = $c->user->get_object();
            $user->last_whisper($current_time);
            $user->update();
            
            $c->stash->{'message'} = "SneakyCat heard you.";
            $c->detach('share');
        }
    } else {
        $c->detach("access_denied")
    }
}

sub access_denied :Local :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{'template'} = 'ideas/accessdenied.tt';
    
    ## tell the user SneakyCat is ignoring them.
    $c->stash->{'message'} = "SneakyCat has ideas of his own and is ignoring you.";
    
}

=head1 AUTHOR

Jay Kuri

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
