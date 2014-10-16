package MasonApp::Controller::Root;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

__PACKAGE__->config->{namespace} = '';

sub index : Path Args(0) {}

sub default : Path {
    my ($self, $ctx) = @_;
    $ctx->response->body( 'Page not found' );
    $ctx->response->status(404);
}

sub end : ActionClass('RenderView') {}

1;
