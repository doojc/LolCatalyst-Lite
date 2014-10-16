package DispatchTest::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

use YAML;
__PACKAGE__->config->{namespace} = '';

 sub index : Path Args(0) {
     my ($self, $c) = @_;
     push @{ $c->stash->{matches} }, "index before";
     $c->forward('private_action');
     push @{ $c->stash->{matches} }, "index after";
 }

 sub private_action : Private {
     my ( $self, $c ) = @_;
     push @{ $c->stash->{matches} }, "private_action";
 }

 sub path1 : Path('one') Args {
    my ($self, $c) = @_;
    push @{ $c->stash->{matches} }, { "path1" =>  $c->req->args };
    $c->forward( 'path2', [ qw/new set of args/ ]);
    push @{ $c->stash->{matches} }, { "path1" =>  $c->req->args };
 }

 sub path2 : Path('two') Args {
     my ($self, $c ) = @_;
     push @{ $c->stash->{matches} }, { "path2" =>  $c->req->args };
 }

 
sub end : ActionClass('RenderView') {
    my ($self, $c) = @_;
    push @{$c->stash->{matches}}, 'Root' . ' -> ' . "end";
    $c->res->body("<pre>\n" . Dump ($c->stash->{matches}) . "</pre>");
}

1;
