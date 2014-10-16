 package MyCalais::Model::Calais;
 use strict;
 use warnings;
 use parent 'Catalyst::Model::Adaptor';

 __PACKAGE__->config(
     class => 'MyCalais::Processor',
 );

 sub mangle_arguments {
     my ($self, $args) = @_;
     return %$args;
 }

 1;

