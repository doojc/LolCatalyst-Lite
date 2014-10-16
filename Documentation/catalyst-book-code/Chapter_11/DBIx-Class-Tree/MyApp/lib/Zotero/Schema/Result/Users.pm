package Zotero::Schema::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "userid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "username",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("userid");
__PACKAGE__->has_many(
  "groupitems_createdbyuserids",
  "Zotero::Schema::Result::Groupitems",
  { "foreign.createdbyuserid" => "self.userid" },
);
__PACKAGE__->has_many(
  "groupitems_lastmodifiedbyuserids",
  "Zotero::Schema::Result::Groupitems",
  { "foreign.lastmodifiedbyuserid" => "self.userid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ps4nO32zw4hr+QFreFqOUA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
