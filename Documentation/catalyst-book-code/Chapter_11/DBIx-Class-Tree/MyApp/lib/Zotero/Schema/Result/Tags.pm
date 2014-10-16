package Zotero::Schema::Result::Tags;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("tags");
__PACKAGE__->add_columns(
  "tagid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "type",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "dateadded",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => undef,
  },
  "datemodified",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
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
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "key",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("tagid");
__PACKAGE__->add_unique_constraint("libraryid_name_type_unique", ["libraryid", "name", "type"]);
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->has_many(
  "itemtags",
  "Zotero::Schema::Result::Itemtags",
  { "foreign.tagid" => "self.tagid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yVt1hOb0x5hD83CN6GZjMQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
