package SneakyCat::Model::SneakyCat;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'SneakyCat::Schema',
    connect_info => [
        'dbi:SQLite:db/sneakycat.db',
        
    ],
);

=head1 NAME

SneakyCat::Model::SneakyCat - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<SneakyCat>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<SneakyCat::Schema>

=head1 AUTHOR

Jay Kuri

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
