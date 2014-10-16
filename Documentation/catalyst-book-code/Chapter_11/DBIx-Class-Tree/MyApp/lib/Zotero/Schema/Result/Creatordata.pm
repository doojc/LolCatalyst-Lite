package Zotero::Schema::Result::Creatordata;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("creatorData");
__PACKAGE__->add_columns(
  "creatordataid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "firstname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "lastname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "shortname",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "fieldmode",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
  "birthyear",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("creatordataid");
__PACKAGE__->has_many(
  "creators",
  "Zotero::Schema::Result::Creators",
  { "foreign.creatordataid" => "self.creatordataid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u1w4+MBLnfmXQ4mGWOGieQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
