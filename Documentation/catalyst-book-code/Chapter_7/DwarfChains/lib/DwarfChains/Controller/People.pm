 package DwarfChains::Controller::People;

 use strict;
 use warnings;
 use parent 'Catalyst::Controller';

 sub get_ready :Chained("/") :PathPart("name") :CaptureArgs(0) {
    my ($self, $c) = @_;
    $c->push_stack($self );
 }

 sub get_root :Chained("get_ready") :PathPart("") :Args(0) {
    my ($self, $c) = @_;
    $c->push_stack($self );
 }

 1;
 
