package Zotero::Schema::Result::Relations;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("relations");
__PACKAGE__->add_columns(
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "subject",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "predicate",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "object",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "clientdatemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("libraryid", "subject", "predicate", "object");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EbGO/HOqjT0TvkteBbHxIQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
