package MyApp::View::QRCode;
use strict;
use warnings;
use base 'Catalyst::View::GD::Barcode::QRcode';
__PACKAGE__->config(
    ecc => 'M',
    version => 4,
    module_size => 4,
    img_type => 'png'
);
1;
