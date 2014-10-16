package MyApp::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub index :Path Args(0) {
    my ($self, $c) = @_;
    $c->stash(gd_image => $self->create_image,
              current_view => 'Graphics',
          );
}

sub create_image {
    my $self = shift;
    my $img = GD::Image->new(100, 100);
    my $white = $img->colorAllocate(255, 255, 255);
    my $black = $img->colorAllocate(0, 0, 0);
    my $red = $img->colorAllocate(255, 0, 0);
    $img->rectangle(0, 0, 20, 20, $black);
    $img->rectangle(20, 20, 50, 50, $red);
    return $img;
}

sub generate_qr_code :Path('qr') {
    my ($self, $c) = @_;
    $c->stash(qrcode => 'http://catalystframework.org',
              current_view => 'QRCode',
          );
}


=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
