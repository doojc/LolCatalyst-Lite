package Zotero::Schema::Result::Groupitems;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("groupItems");
__PACKAGE__->add_columns(
  "itemid",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "createdbyuserid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
  "lastmodifiedbyuserid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("itemid");
__PACKAGE__->belongs_to(
  "createdbyuserid",
  "Zotero::Schema::Result::Users",
  { userid => "createdbyuserid" },
);
__PACKAGE__->belongs_to(
  "lastmodifiedbyuserid",
  "Zotero::Schema::Result::Users",
  { userid => "lastmodifiedbyuserid" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-30 11:42:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PKuBzE6mMJX5A/usBj7BYA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
