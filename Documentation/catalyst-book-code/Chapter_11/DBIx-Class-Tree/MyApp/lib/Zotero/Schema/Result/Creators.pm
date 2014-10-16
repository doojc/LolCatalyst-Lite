package Zotero::Schema::Result::Creators;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("creators");
__PACKAGE__->add_columns(
  "creatorid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "creatordataid",
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
__PACKAGE__->set_primary_key("creatorid");
__PACKAGE__->add_unique_constraint("libraryid_key_unique", ["libraryid", "key"]);
__PACKAGE__->has_many(
  "itemcreators",
  "Zotero::Schema::Result::Itemcreators",
  { "foreign.creatorid" => "self.creatorid" },
);
__PACKAGE__->belongs_to(
  "creatordataid",
  "Zotero::Schema::Result::Creatordata",
  { creatordataid => "creatordataid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mnL8zHqw6dATccpfuf83Eg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
