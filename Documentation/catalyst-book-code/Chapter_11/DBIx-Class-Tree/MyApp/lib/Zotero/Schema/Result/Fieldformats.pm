package Zotero::Schema::Result::Fieldformats;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fieldFormats");
__PACKAGE__->add_columns(
  "fieldformatid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "regex",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "isinteger",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("fieldformatid");
__PACKAGE__->has_many(
  "fields",
  "Zotero::Schema::Result::Fields",
  { "foreign.fieldformatid" => "self.fieldformatid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Vz14D9oVu39tIQvvDa9blw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
