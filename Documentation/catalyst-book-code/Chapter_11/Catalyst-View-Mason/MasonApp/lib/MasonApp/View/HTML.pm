package MasonApp::View::HTML;

use Moose;
use namespace::autoclean;

extends 'Catalyst::View::Mason';

__PACKAGE__->config(
    comp_root            => MasonApp->path_to(qw/root templates/),
    default_escape_flags => 'h',
);

1;
