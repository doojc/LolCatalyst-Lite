 package DwarfChains::Controller::People::Info;

 use strict;
 use warnings;

 use parent 'Catalyst::Controller';

 sub get_info_ready :Chained("/people/get_ready") :PathPart("who") :CaptureArgs(0) {
     my ($self, $c) = @_;
     $c->push_stack($self);
 }

 sub list :Chained("get_info_ready") :PathPart("") :Args(0) {
     my ($self, $c) = @_;
     $c->push_stack($self);
 }

 sub create :Chained("get_info_ready") : PathPart('add') : Args(0) {
     my ($self, $c) = @_;
     $c->push_stack($self);
 }

 1;
