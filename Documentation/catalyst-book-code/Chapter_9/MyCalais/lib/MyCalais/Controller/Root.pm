 package MyCalais::Controller::Root;

 use strict;
 use warnings;
 use parent 'Catalyst::Controller';
 use YAML;
 
 __PACKAGE__->config->{namespace} = '';

 sub default :Path {
     my ( $self, $c ) = @_;
     my $url = $c->req->query_parameters->{url};
     eval {
         $c->stash(response => $c->model('Calais')->url_as_data( $url) );
     };
     if ($@) {
         $c->stash(response => { error => 'the opencalais service is experiencing some problems.  Please retry after a few seconds',
                                 error_text => "$@" });
     }
 }

 sub end : ActionClass('RenderView') {
     my ($self, $c) = @_;
     $c->res->body('<pre>' . Dump ($c->stash->{response}) .  '</pre>');
 }

 1;
