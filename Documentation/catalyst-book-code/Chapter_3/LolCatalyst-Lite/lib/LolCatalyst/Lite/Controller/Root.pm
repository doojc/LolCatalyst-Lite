package LolCatalyst::Lite::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->status(404);
    $c->response->body( 'Page not found' );
}

sub translate :Local {
     my ($self, $c) = @_;
     my $lol = $c->req->body_params->{lol}; # only for a POST request
         # $c->req->params->{lol} would catch GET or POST
         # $c->req->query_params would catch GET params only
     $c->stash(
       lol => $lol,
       result => $c->model('Translate')->translate($lol),
       template => 'index.tt',
     );
}

sub translate_service : Local {
    my ($self, $c) = @_;
    $c->forward('translate');
    $c->stash->{current_view} = 'Service';
}

sub end : ActionClass('RenderView') {
    my ($self, $c) = @_;
    my $errors = scalar @{$c->error};
    if ($errors) {
        $c->res->status(500);
        $c->res->body('internal server error');
        $c->clear_errors;
    }
}

1;
