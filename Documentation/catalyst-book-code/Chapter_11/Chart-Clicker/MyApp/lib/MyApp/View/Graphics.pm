package MyApp::View::Graphics;

use strict;
use base 'Catalyst::View::Graphics::Primitive';

__PACKAGE__->config(
    driver => 'Cairo',
    driver_args => { format => 'png' },
    content_type => 'image/png'
);

=head1 NAME

MyApp::View::Graphics - Catalyst Graphics::Primitive View

=head1 SYNOPSIS

See L<MyApp>

=head1 DESCRIPTION

Catalyst Graphics::Primitive View.

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
