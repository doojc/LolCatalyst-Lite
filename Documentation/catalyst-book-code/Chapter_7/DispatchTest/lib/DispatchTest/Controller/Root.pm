package DispatchTest::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

use YAML;
__PACKAGE__->config->{namespace} = '';

sub catchall : Path {
    my ( $self, $c ) = @_;
    push @{$c->stash->{matches}},
        { 'Root' . ' -> ' . $c->action => $c->req->args };
}

  sub begin : Private {
      my ($self, $c) = @_;
      push @{$c->stash->{matches}},
          { 'Root' . ' -> ' . 'begin' => $c->req->args };
  }

 sub auto : Private {
     my ($self, $c) = @_;
     push @{$c->stash->{matches}},
         { 'Root' . ' -> ' . 'auto'  => $c->req->args };
 }

sub end : ActionClass('RenderView') {
    my ($self, $c) = @_;
    push @{$c->stash->{matches}}, 'Root' . ' -> ' . "end";
    $c->res->body("<pre>\n" . Dump ($c->stash->{matches}) . "</pre>");
}

1;
