 package DispatchTest::Controller::Dwarves;

 use strict;
 use warnings;
 use base 'Catalyst::Controller';

 sub catchall : Path {
     my ( $self, $c ) = @_;
     push @{$c->stash->{matches}},
         { 'Dwarves' . ' -> ' . $c->action => $c->req->args };
 }

 sub begin : Private {
     my ($self, $c) = @_;
     push @{$c->stash->{matches}},
         { 'Dwarves' . ' -> ' . 'begin' => $c->req->args },
     }

  sub auto : Private {
      my ($self, $c) = @_;
      push @{$c->stash->{matches}},
          { 'Dwarves' . ' -> ' . 'auto'  => $c->req->args };
  }

 sub answer_phone :Regex('(.*?\.mp3)') {
     my ($self, $c) = @_;
     push @{$c->stash->{matches}},
         { 'Dwarves' . ' -> ' . $c->action  => [{ args => $c->req->args} , {captures => $c->req->captures}] };
 }

  
 1;
