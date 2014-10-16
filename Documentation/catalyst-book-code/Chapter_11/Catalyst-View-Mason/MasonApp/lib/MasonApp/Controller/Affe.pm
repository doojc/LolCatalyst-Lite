package MasonApp::Controller::Affe;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index : Path Args(0) {
    my ($self, $ctx) = @_;
    $ctx->stash(things => [qw/
        affe
        tiger
        loewe
        birne
    /]);
}

1;
