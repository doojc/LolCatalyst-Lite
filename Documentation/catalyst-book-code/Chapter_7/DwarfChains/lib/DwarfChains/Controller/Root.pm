 package DwarfChains::Controller::Root;

 use strict;
 use warnings;
 use parent 'Catalyst::Controller';
 use YAML;
 
 __PACKAGE__->config->{namespace} = '';

 sub index :Path :Args(0) {
     my ( $self, $c ) = @_;
     $c->res->redirect( 'people' );
 }

 sub default :Path {
     my ( $self, $c ) = @_;
     $c->response->body( 'Page not found' );
     $c->response->status(404);
 }

 sub end : ActionClass('RenderView') {
     my ($self, $c) = @_;
     my $matches = Dump $c->stash->{matches};
     $c->res->body("<pre>\n" .  $matches . "</pre>");
 }

 
 1;
