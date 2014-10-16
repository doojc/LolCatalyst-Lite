package Zotero::Schema::Result::Libraries;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("libraries");
__PACKAGE__->add_columns(
  "libraryid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "librarytype",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("libraryid");
__PACKAGE__->has_many(
  "groups",
  "Zotero::Schema::Result::Groups",
  { "foreign.libraryid" => "self.libraryid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EcytWP0ht7b/ZHvt6ry24g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
