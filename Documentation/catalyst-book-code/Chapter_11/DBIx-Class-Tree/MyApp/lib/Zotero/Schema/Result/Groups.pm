package Zotero::Schema::Result::Groups;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("groups");
__PACKAGE__->add_columns(
  "groupid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "libraryid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "name",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "editable",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "fileseditable",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("groupid");
__PACKAGE__->add_unique_constraint("libraryID_unique", ["libraryid"]);
__PACKAGE__->belongs_to(
  "libraryid",
  "Zotero::Schema::Result::Libraries",
  { libraryid => "libraryid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iU8Y/pcMm/Gkicm8yNRnsg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
